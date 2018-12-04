package com.chixing.controller;

import com.chixing.service.impl.CustomerServiceImpl;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import static com.chixing.util.reduceImg.reduceImg;

@RestController
public class UploadHead {
    @Autowired
    private CustomerServiceImpl customerService;

    @RequestMapping(value = "/uploadPoster",method =RequestMethod.POST)
    public String uploadPoster(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("开始上传照片================================");
        String customerId = request.getParameter("computecustomerId");
        String ret_fileName = null;// 返回给前端已修改的图片名称
        String base64Img = request.getParameter("image");
        System.out.println("base64Img======================="+base64Img);
        // 临时文件路径
        //String dirTemp = "\\upload\\temp";
        String dirTemp = "\\upload";
        String uploadImg = "D:\\Ylsn Image\\cust-photo";

        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        // response.setContentType("text/html; charset=UTF-8");
        // PrintWriter out = response.getWriter();

//        String realPath = request.getServletContext().getRealPath("");
        String tempPath = request.getServletContext().getRealPath("/")
                + dirTemp;
        File file_normer = new File(uploadImg+"/");
        if (!file_normer.exists()) {
            file_normer.mkdirs();
        }
        // 用于设置图片过大，存入临时文件
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(20 * 1024 * 1024); // 设定使用内存超过5M时，将产生临时文件并存储于临时目录中。
        factory.setRepository(new File(tempPath)); // 设定存储临时文件的目录。

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");
        if (base64Img == null) // 图像数据为空
            return "close";
        base64Img = base64Img.replaceAll("data:image/png;base64,", "");
//        base64Img = base64Img.replace("base64,", "");
//        System.out.println("第二次base64Img======================="+base64Img);
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            // Base64解码
            byte[] b= decoder.decodeBuffer(base64Img);
//            byte[]   b = Base64.decodeBase64(base64Img.replace("data:image/png;base64,", ""));
//            base64Img=base64Img.replace("base64,", "");
            System.out.println("b[i]======================="+b);
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {// 调整异常数据
                    b[i] += 256;
                }
            }
            // 生成jpeg图片
//            SimpleDateFormat df=new SimpleDateFormat("yyyyMMddhhmmss");
//           String  dateStr=  df.format(new Date());
//            ret_fileName =new String((df.format(new Date()) +".jpg").getBytes("UTF-8"),"UTF-8") ;
        String custPhone=(String) request.getSession().getAttribute("custPhone");
            ret_fileName =custPhone+".jpg";
            System.out.println("ret_fileName=========="+ret_fileName);
            File file = new File( uploadImg+"/" + ret_fileName);
            OutputStream out = new FileOutputStream(file);
            out.write(b);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("压缩图片开始...");
        File srcfile = new File(uploadImg+"/" + ret_fileName);
        System.out.println("压缩前srcfile size:" + srcfile.length());
        reduceImg(uploadImg+"/" + ret_fileName, uploadImg+"/" + ret_fileName, 1000, 1000,null);
        File distfile = new File( uploadImg+"/" + ret_fileName);
        System.out.println("压缩后distfile size:" + distfile.length());
        int custId= (int) request.getSession().getAttribute("custId");
        customerService.updateUserPhoto(ret_fileName,custId);
        return "ok";
    }

}

