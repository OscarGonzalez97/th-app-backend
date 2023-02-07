package com.roshka.service;

import com.roshka.modelo.Beneficio;
import com.roshka.modelo.Birthday;
import com.roshka.repositorio.BeneficioRepository;
import com.roshka.repositorio.BirthdayRepository;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.ContentType;
import org.apache.hc.core5.http.ParseException;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.apache.hc.core5.http.io.entity.StringEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.io.IOException;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Random;

@Configuration
@EnableScheduling
public class Scheduler {
    @Autowired
    BirthdayRepository birthdayRepository;
    @Autowired
    BeneficioRepository beneficioRepository;
    @PersistenceContext
    private EntityManager entityManager;

    //    @Scheduled(cron = "0 0 8 * * MON-FRI")
    @Scheduled(cron = "0 * * * * *")
    public void cumples() {
        String url = "https://hooks.slack.com/services/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";
        // Verificar el cumpleaños de quien es
        List<Birthday> cumples = birthdayRepository.findAllByFecha(new Date());
        for (Birthday cumple : cumples) {
            String json = "{\n" +
                    "\"blocks\": [\n" +
                    "{\n" +
                    "\"type\": \"section\",\n" +
                    "\"text\": {\n" +
                    "\"type\": \"mrkdwn\",\n" +
                    "\"text\": \"Buenos días <!channel> \n Hoy está de cumpleaños *" + cumple.getNombreCompleto() + "* <@" + cumple.getIdSlack() + ">. 🥳 ¡Que los cumplas muy feliz te desea la Roshka! Que en la vida siempre encuentres razones para sonreír 🥳\",\n" +
                    "}" +
                    "}," +
                    "{" +
                    "\"type\": \"divider\"" +
                    "}," +
                    "{\n" +
                    "\"type\": \"image\",\n" +
                    "\"title\": {\n" +
                    "\"type\": \"plain_text\",\n" +
                    "\"text\": \"" + cumple.getNombreCompleto() + "\"\n" +
                    "},\n" +
                    "\"block_id\": \"image4\",\n" +
                    "\"image_url\": \"http://placekitten.com/500/500\",\n" +
                    "\"alt_text\": \"An incredibly cute kitten.\"\n" +
                    "}\n" +
                    "]\n" +
                    "}" +
                    "";
            String result = null;
            HttpPost httpPost = new HttpPost(url);
            httpPost.setEntity(new StringEntity(json, ContentType.APPLICATION_JSON));

            try (CloseableHttpClient httpclient = HttpClients.createDefault()) {
                try (CloseableHttpResponse response = httpclient.execute(httpPost)) {
                    result = EntityUtils.toString(response.getEntity());
                }
            } catch (IOException | ParseException e) {
                e.printStackTrace();
            }
        }
    }

    //    @Scheduled(cron = "0 0 15 * * FRI")
    @Scheduled(cron = "0 * * * * *")
    public void beneficios() {
        String url = "https://hooks.slack.com/services/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";
        // Traer random
        Beneficio beneficio = getRandomBeneficio();
        if (beneficio != null) {
            String json = "{" +
                    "\"blocks\": [" +
                    "{" +
                    "\"type\": \"section\"," +
                    "\"text\": {" +
                    "\"type\": \"mrkdwn\"," +
                    "\"text\": \"Te recordamos uno de nuestros beneficios <!channel>\"" +
                    "}" +
                    "}," +
                    "{" +
                    "\"type\": \"header\"," +
                    "\"text\": {" +
                    "\"type\": \"plain_text\"," +
                    "\"text\": \"" + beneficio.getTitulo() + "\"," +
                    "\"emoji\": true" +
                    "}" +
                    "}," +
                    "{" +
                    "\"type\": \"section\"," +
                    "\"text\": {" +
                    "\"type\": \"mrkdwn\"," +
                    "\"text\": \"" + beneficio.getDescripcion() + "\"" +
                    "}" +
                    "}" +
                    "]" +
                    "}";
            String result = null;
            HttpPost httpPost = new HttpPost(url);
            httpPost.setEntity(new StringEntity(json, ContentType.APPLICATION_JSON));

            try (CloseableHttpClient httpclient = HttpClients.createDefault()) {
                try (CloseableHttpResponse response = httpclient.execute(httpPost)) {
                    result = EntityUtils.toString(response.getEntity());
                }
            } catch (IOException | ParseException e) {
                e.printStackTrace();
            }
        }
    }

    public Beneficio  getRandomBeneficio() {
        String query = "SELECT o.id FROM Beneficio o ORDER BY random()";
        Query q = entityManager.createQuery(query);
        q.setMaxResults(1);
        Optional<Beneficio> beneficio = beneficioRepository.findById((Long) q.getSingleResult());
        if (beneficio.isPresent()) {
            return beneficio.get();
        }
        return null;
    }

}
