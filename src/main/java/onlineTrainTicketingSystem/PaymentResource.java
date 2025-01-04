package onlineTrainTicketingSystem;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*;
import java.util.List;

@Path("/payments")
public class PaymentResource {

    @Context
    UriInfo uriInfo;
    @Context
    Request request;

    private PaymentDao paymentDao = new PaymentDao();

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<PaymentData> getAllPayments() {
        return paymentDao.findAll();
    }

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getPayment(@PathParam("id") Long id) {
        PaymentData payment = paymentDao.findById(id);
        if (payment != null) {
            return Response.status(200).entity(payment).build();
        } else {
            return Response.status(404).entity("Payment not found.").build();
        }
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createPayment(PaymentData payment) {
        if (paymentDao.findById(payment.getId()) == null) {
            paymentDao.savePayment(payment);
            return Response.status(201).entity("Payment created: " + payment.getId()).build();
        } else {
            return Response.status(409).entity("Conflict: Payment already exists.").build();
        }
    }

    @PUT
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updatePayment(@PathParam("id") Long id, PaymentData payment) {
        if ((id != null) && (payment != null)) {
            if (id.equals(payment.getId())) {
                if (paymentDao.findById(id) != null) {
                    paymentDao.updatePayment(payment);
                    return Response.status(200).entity("Payment updated: " + payment.getId()).build();
                }
            }
        }
        return Response.status(404).entity("Payment not found.").build();
    }

    @DELETE
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("/{id}")
        public Response deletePayment(@PathParam("id") Long id) {
        PaymentData payment = paymentDao.findById(id);
        if (payment != null) {
            paymentDao.deletePayment(payment);
            return Response.status(200).entity("Payment deleted: " + payment.getId()).build();
        } else {
            return Response.status(404).entity("Payment not found.").build();
        }
    }
}
