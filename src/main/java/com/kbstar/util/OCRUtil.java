package com.kbstar.util;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Slf4j
public class OCRUtil {
    public static Object getResult(String imgpath, String imgname){

        JSONObject obj = null;

        String apiURL = "https://uhucar79op.apigw.ntruss.com/custom/v1/22471/14074b5f595104ad99441933476c78233e3ed376cb099a8c866b2a0f43a660a5/infer";
        String secretKey = "S0NQUnRhbWNjU0pEeHdjdWJzVnlaZ0FDaEdiTXRweWk=";
        String imageFile = imgpath+imgname;

        try {
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoInput(true);
            con.setDoOutput(true);
            con.setReadTimeout(30000);
            con.setRequestMethod("POST");
            String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
            con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
            con.setRequestProperty("X-OCR-SECRET", secretKey);

            JSONObject json = new JSONObject();
            json.put("version", "V2");
            json.put("requestId", UUID.randomUUID().toString());
            json.put("timestamp", System.currentTimeMillis());
            JSONObject image = new JSONObject();
            image.put("format", "jpg");
            image.put("name", "demo");
            JSONArray images = new JSONArray();
            images.add(image);
            json.put("images", images);
            String postParams = json.toString();

            con.connect();
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            long start = System.currentTimeMillis();
            File file = new File(imageFile);
            writeMultiPart(wr, postParams, file, boundary);
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) {
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            JSONParser parser = new JSONParser();
            obj = (JSONObject)parser.parse(response.toString());
            //System.out.println(response);
        } catch (Exception e) {
            System.out.println(e);
        }

        return obj;
    }

    private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary) throws
            IOException {
        StringBuilder sb = new StringBuilder();
        sb.append("--").append(boundary).append("\r\n");
        sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
        sb.append(jsonMessage);
        sb.append("\r\n");

        out.write(sb.toString().getBytes("UTF-8"));
        out.flush();

        if (file != null && file.isFile()) {
            out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
            StringBuilder fileString = new StringBuilder();
            fileString
                    .append("Content-Disposition:form-data; name=\"file\"; filename=");
            fileString.append("\"" + file.getName() + "\"\r\n");
            fileString.append("Content-Type: application/octet-stream\r\n\r\n");
            out.write(fileString.toString().getBytes("UTF-8"));
            out.flush();

            try (FileInputStream fis = new FileInputStream(file)) {
                byte[] buffer = new byte[8192];
                int count;
                while ((count = fis.read(buffer)) != -1) {
                    out.write(buffer, 0, count);
                }
                out.write("\r\n".getBytes());
            }

            out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
        }
        out.flush();
    }


    public static Map getData(JSONObject obj1){

        String biznum_name = null;
        String biznum_value = null;
        String bizname_name = null;
        String bizname_value = null;
        String bizowner_name = null;
        String bizowner_value = null;
        String bizdate_name = null;
        String bizdate_value = null;
        String bizadd_name = null;
        String bizadd_value = null;


        JSONArray images = (JSONArray)obj1.get("images");
        JSONObject jo1 = (JSONObject)images.get(0);
        JSONArray fields = (JSONArray)jo1.get("fields");

        JSONObject bizobj1 = (JSONObject)fields.get(0);
        biznum_name = (String)bizobj1.get("name");
        biznum_value = (String)bizobj1.get("inferText");

        JSONObject bizobj2 = (JSONObject) fields.get(1);
        bizname_name = (String)bizobj2.get("name");
        bizname_value = (String)bizobj2.get("inferText");

        JSONObject bizobj3 = (JSONObject) fields.get(2);
        bizowner_name = (String)bizobj3.get("name");
        bizowner_value = (String)bizobj3.get("inferText");

        JSONObject bizobj4 = (JSONObject) fields.get(3);
        bizdate_name = (String)bizobj4.get("name");
        bizdate_value = (String)bizobj4.get("inferText");

        JSONObject bizobj5 = (JSONObject) fields.get(4);
        bizadd_name = (String)bizobj5.get("name");
        bizadd_value = (String)bizobj5.get("inferText");


        Map<String, String> map = new HashMap<>();
        map.put(biznum_name, biznum_value);
        map.put(bizname_name, bizname_value);
        map.put(bizowner_name, bizowner_value);
        map.put(bizdate_name, bizdate_value);
        map.put(bizadd_name, bizadd_value);

        return map;
    }

}
