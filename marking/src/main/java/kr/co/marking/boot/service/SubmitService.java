package kr.co.marking.boot.service;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kr.co.marking.boot.BootpayObject;
import kr.co.marking.boot.model.request.Submit;

public class SubmitService {
    static public HttpResponse submit(BootpayObject bootpay, String receiptId) throws Exception {
        if(bootpay.token == null || bootpay.token.isEmpty()) throw new Exception("token 값이 비어있습니다.");
        if(receiptId == null || receiptId.isEmpty()) throw new Exception("userId 값을 입력해주세요.");

        Submit submit = new Submit();
        submit.receiptId = receiptId;

        HttpClient client = HttpClientBuilder.create().build();
        Gson gson = new GsonBuilder()
                .setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)
                .create();
        HttpPost post = bootpay.httpPost("submit", new StringEntity(gson.toJson(submit), "UTF-8"));

        post.setHeader("Authorization", bootpay.token);
        return client.execute(post);
    }
}