package com.moduscreate.java.security.codeql;

import org.glassfish.grizzly.http.server.HttpServer;
import org.glassfish.jersey.grizzly2.httpserver.GrizzlyHttpServerFactory;
import org.glassfish.jersey.server.ResourceConfig;

import java.net.URI;
import java.util.concurrent.CountDownLatch;

public class Main {
    public static final String BASE_URI = "http://0.0.0.0:8080/api/";

    public static void main(String[] args) throws Exception {
        final ResourceConfig rc = new ResourceConfig().packages("com.moduscreate.java.security.codeql");
        final HttpServer server = GrizzlyHttpServerFactory.createHttpServer(URI.create(BASE_URI), rc);

        System.out.println("Jersey app started at " + BASE_URI + "\nPress Ctrl+C to stop.");

        // Keep the main thread alive indefinitely
        CountDownLatch keepAlive = new CountDownLatch(1);
        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            server.shutdownNow();
            keepAlive.countDown();
        }));
        keepAlive.await();
    }
}
