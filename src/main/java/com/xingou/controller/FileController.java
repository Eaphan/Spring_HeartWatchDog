package com.xingou.controller;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.xingou.dao.FileDao;
import com.xingou.entity.File;
import com.xingou.entity.User;
import com.xingou.service.FileService;
import com.xingou.tools.MyTools;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by viczyf on 2017/11/29.
 */
@Controller
public class FileController implements ServletConfigAware, ServletContextAware {
    //    应该包含几个操作，到file列表，指向上传界面，指向下载界面，删除记录，上传文件
    private ServletContext servletContext;

    public void setServletContext(ServletContext arg0) {
        this.servletContext = arg0;
    }

    private ServletConfig servletConfig;

    public void setServletConfig(ServletConfig arg0) {
        this.servletConfig = arg0;
    }

    private FileService fileService;

    @Autowired
    public void setFileService(FileService fileService) {
        this.fileService = fileService;
    }

    @RequestMapping(value = "/fileList", method = RequestMethod.GET)
    public ModelAndView filelist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        List<File> fileList = fileService.selectFile(uid);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("user/filelist");
        mav.addObject("fileList", fileList);
        return mav;
    }

    @RequestMapping(value = "/fileUpload", method = RequestMethod.GET)
    public String fileupload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return "user/fileupload";
    }

    //上传文件
    @RequestMapping(value = "/fileAdd", method = RequestMethod.POST)
    public ModelAndView fileAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        ModelAndView model = new ModelAndView();
        User user = (User) session.getAttribute("user");
        String filePath = "/data/upload/";
        int uid = user.getUid();
        File file = new File();
        SmartUpload su = new SmartUpload();
        long maxsize = 2097152L;
        try {
            su.initialize(servletConfig, request, response);
            su.setMaxFileSize(maxsize);
            su.setAllowedFilesList("jpg,gif,png,txt,doc,pdf,docx");
            su.upload();
            String fileinfo = su.getRequest().getParameter("info");
            com.jspsmart.upload.File uploadFile = su.getFiles().getFile(0);
            String fileAddr = filePath + uid + "_" + fileService.queryMaxId() + "." + uploadFile.getFileExt();
            String now = MyTools.changeTime(new Date());
            file.setUser(user);
            file.setFileaddr(fileAddr);
            file.setFiledate(now);
            file.setFileinfo(fileinfo);
            System.out.println(fileAddr);
            user.getFiles().add(file);
            fileService.saveFile(file);
            uploadFile.saveAs(fileAddr);
            model.setViewName("redirect:/fileList");
        } catch (SecurityException var19) {
            model.addObject("errorMsg", "上传文件失败!上传的文件类型只允许为：jpg,gif,png,txt,doc,docx,pdf;且文件大小不超过2MB");
            model.setViewName("redirect:/fileUpload");
        } catch (SmartUploadException var20) {
            model.addObject("errorMsg", "上传文件失败!");
            model.setViewName("redirect:/fileUpload");
        }
        return model;

    }

//    下载文件
    @RequestMapping(value = "/fileDownload/{id}")
    public String fileDownload(HttpSession session, @PathVariable("id") int id, Map<String,Object> map){
        User user = (User)session.getAttribute("user");
        int uid = user.getUid();
        File file = fileService.querySingleFile(uid, id);
        map.put("file", file);
        return "user/filedownload";
    }

    //    删除文件
    @RequestMapping(value = "/fileDelete/{id}")
    public String fileDelete(HttpSession session, @PathVariable("id") int id) {
        User user = (User)session.getAttribute("user");
        int uid = user.getUid();
        File fileBean = fileService.querySingleFile(uid, id);
        String fileAddr = fileBean.getFileaddr();
        String fileDir = session.getServletContext().getRealPath("/");
        String delFile = fileDir + fileAddr;
        java.io.File file = new java.io.File(delFile);
        if (fileBean != null) {
            fileService.deleteFile(uid, id);
            boolean result = file.delete();
        }
        return "redirect:/fileList";
    }
//    public ModelAndView fileDelete(HttpSession session, @PathVariable("id") int id) {
//        ModelAndView model = new ModelAndView();
//        User user = (User)session.getAttribute("user");
//        int uid = user.getUid();
//        File fileBean = fileService.querySingleFile(uid, id);
//        String fileAddr = fileBean.getFileaddr();
//        String fileDir = session.getServletContext().getRealPath("/");
//        String delFile = fileDir + fileAddr;
//        java.io.File file = new java.io.File(delFile);
//        if (fileBean != null) {
//            fileService.deleteFile(uid, id);
//            boolean result = file.delete();
//        }
//        model.setViewName("redirect:/fileList");
//        return model;
//    }
}

