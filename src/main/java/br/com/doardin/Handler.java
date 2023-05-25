package br.com.doardin;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyResponseEvent;
import com.amazonaws.services.lambda.runtime.events.SQSEvent;

public class Handler implements RequestHandler<SQSEvent, APIGatewayProxyResponseEvent> {

    @Override
    public APIGatewayProxyResponseEvent handleRequest(SQSEvent input, Context context) {
        for (var record : input.getRecords()) {
            System.out.println(record.getBody());
        }
        return new APIGatewayProxyResponseEvent().withStatusCode(200);
    }

}
