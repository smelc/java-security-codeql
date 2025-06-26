package com.moduscreate.java.security.codeql;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.joor.Reflect;

@Path("/invoke")
public class App {

    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public Response invokeMethod(@FormParam("method") String method) {
        System.out.println("Received: " + method);

        try {
            Object result = Reflect.on(new Target()).call(method).get();
            return Response.ok(result.toString()).build();
        } catch (Exception e) {
            return Response.status(Response.Status.BAD_REQUEST)
                           .entity("Error invoking method: " + e.getMessage())
                           .build();
        }
    }

    public String getGreeting() {
        return "Hello, World!";
    }
}