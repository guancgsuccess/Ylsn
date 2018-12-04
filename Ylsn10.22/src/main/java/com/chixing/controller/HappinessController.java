package com.chixing.controller;

import com.chixing.entity.Happiness;
import com.chixing.service.HappinessService;
import com.chixing.constant.ConstantData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.List;

@RestController
@RequestMapping("/happiness")
public class HappinessController {

    private static final Logger logger = LoggerFactory.getLogger(HappinessController.class);
    @Autowired
    private HappinessService happinessService;

    @GetMapping("uploadCheck")
    public Integer uploadCheck(String nickname, HttpSession session){
        Integer state=0;
        Integer custId=(Integer) session.getAttribute("custId");
        state=happinessService.uploadCheck(custId,nickname);
        return state;
    }
    @GetMapping("toUpload")
    public ModelAndView toUpload(Happiness happiness,HttpSession session){
       ModelAndView modelAndView=new ModelAndView();
       modelAndView.setViewName("upload");
       modelAndView.addObject("happiness",happiness);
        return modelAndView;
    }
    @PostMapping("uploadPhoto")
    public String upload(@RequestParam("fileData1") MultipartFile file, HttpServletRequest request,HttpSession session)throws ServletException, IOException {
        if (file.isEmpty()) {
            return new String("文件为空");
        }
       // 获取文件名
        String fileName = file.getOriginalFilename();
        logger.info("上传的文件名为：" + fileName);
       // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        logger.info("上传的后缀名为：" + suffixName);
        if(".jpg".equals(suffixName.trim())||".png".equals(suffixName.trim())||".gif".equals(suffixName.trim())||".jpeg".equals(suffixName.trim())
                ||".GIF".equals(suffixName.trim())||".JPG".equals(suffixName.trim())||".bmp".equals(suffixName.trim())||".PNG".equals(suffixName.trim())){

            // 文件上传后的路径
            String filePath = ConstantData.UPLOAD_PATH+ "\\";//服务器路径
           // 解决中文问题，liunx下中文路径，图片显示问题
           // fileName = UUID.randomUUID() + suffixName;
            fileName=session.getAttribute("custPhone").toString()+"_" + UUID.randomUUID().toString().replace("-", "")+".png";
            File dest = new File(filePath +fileName);
           // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();

            }
            try {
                file.transferTo(dest);

            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "上传成功";
        }
        return new String("上传的不是图片！");
    }

    @GetMapping("deletePhoto/{photoName}")
    public String delete(@PathVariable String photoName,HttpSession session)throws ServletException, IOException {

        String path=ConstantData.UPLOAD_PATH+"\\"+photoName;
        String path1=ConstantData.HOME_PATH+"\\"+photoName;
        File file=new File(path);
        File file1=new File(path1);
        boolean flag=false;
        if(file.exists())
            flag=file.delete();
        if(file1.exists())
            flag=file1.delete();
        if(flag)
            return "删除成功";
        else
            return "删除失败";
    }

    @GetMapping("HomePhoto/{photoName}")
    public String changHomePhoto(@PathVariable String photoName,HttpSession session)throws ServletException, IOException {

        String custPhone=session.getAttribute("custPhone").toString();
        File file=new File(ConstantData.UPLOAD_PATH);
        File file1=new File(ConstantData.HOME_PATH);
        File[]files=file.listFiles();
        File[]files1=file1.listFiles();
        for(int i=0;i<files.length;i++)
            if(files[i].getName().split("_")[0].equals(custPhone)&&files[i].getName().split("\\.")[1].equals("jpg")) {
                happinessService.changImgType(files[i].getPath(), ConstantData.UPLOAD_PATH, ".png");
                files[i].delete();
            }
        for(int i=0;i<files1.length;i++)
            if(files1[i].getName().split("_")[0].equals(custPhone))
                files1[i].delete();
        String path=ConstantData.UPLOAD_PATH+"\\"+photoName;
        System.out.println(path);
        boolean flag=false;
        flag=happinessService.changImgType(path,ConstantData.UPLOAD_PATH,".jpg");
        flag=happinessService.changImgType(path.split("\\.")[0]+".jpg",ConstantData.HOME_PATH,".jpg");
        flag=new File(path).delete();
        if(flag==true)
            return "设置成功";
        else
            return "设置失败";
    }
    @GetMapping("getPhotoList")
    public List<String> getPhotoList(HttpSession session){
        String path=ConstantData.UPLOAD_PATH;
        File file=new File(path);
        File []fileList;
        if(file.exists()) {
            fileList = file.listFiles();
            List<String> fileNameList = new ArrayList<>();
            for (int i = 0; i < fileList.length; i++) {
                if(fileList[i].getName().split("_")[0].equals(session.getAttribute("custPhone").toString()))
                    fileNameList.add(fileList[i].getName());
            }
            return fileNameList;
        }
        return null;
    }

    @PostMapping("saveHappiness")
    public ModelAndView saveHappiness(Happiness happiness)throws ServletException, IOException {
        happiness.setHappImages(ConstantData.UPLOAD_PATH);
        happinessService.saveHappiness(happiness);
       ModelAndView modelAndView=new ModelAndView();
       modelAndView.setViewName("upload0");
       return modelAndView;
    }

    @GetMapping("getHappinessPhoto")
    public Set<Map<String,Happiness>> getHappinessPhoto(Integer count){

        File file=new File(ConstantData.HOME_PATH);
        if(file.exists()) {
            File []fileList = file.listFiles();
            List<String> phoneList = new ArrayList<>();

            Set<Map<String,Happiness>>list=new TreeSet<>(new Comparator<Map<String, Happiness>>() {
                @Override
                public int compare(Map<String, Happiness> o1, Map<String, Happiness> o2) {
                   if(o1.get("happinessInfo").getHappTime().getTime()>o2.get("happinessInfo").getHappTime().getTime())
                       return -1;
                   return 1;
                }
            });
            Happiness happiness=null;
             if(fileList.length<=count)
                 count=fileList.length;
            for (int i = 0; i <count; i++) {
                phoneList.add(fileList[i].getName().split("_")[0]);
            }
            for(int i=0;i<count;i++) {
                Map<String,Happiness>map=new HashMap<>();
                happiness=happinessService.getHappinessByPhone(phoneList.get(i));
                if(happiness!=null) {
                    happiness.setHappImages(happiness.getHappImages() + "," + fileList[i].getName());
                    map.put("happinessInfo", happiness);
                    list.add(map);
                }
            }
            return list;
        }
        return  null;

    }

}
