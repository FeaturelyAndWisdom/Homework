package com.ks.controller;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.ks.po.User;
import com.ks.po.UserVo;
import com.ks.service.IUserService;
import com.ks.tool.UploadFile;
import com.sun.istack.internal.Nullable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;

@Controller
public class UserController {

    //验证码生产类
    @Autowired
    private Producer captchaProducer;

    //用户Service
    @Resource(name = "UserServiceImpl")
    private IUserService us;

    /**
     * 验证码Controller
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/kaptcha")
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();

        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");

        String capText = captchaProducer.createText();
        request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(bi, "jpg", out);

        try {
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public String login(HttpServletRequest req, HttpServletResponse res,
                        @RequestBody UserVo uv){
        User user = uv.getUser();
        String valicode = uv.getValicode();

        String vcode = (String) req.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        if(!valicode.equals(vcode)){
            return "code error";
        }
        try {
            User loguser = us.login(user);
            if(loguser==null) return "fail";
            if(loguser.getIsdel()==1) return "banaccount";
            if(loguser.getRole()==0) {
                req.getSession().setAttribute("user",loguser);
            }else {
                req.getSession().setAttribute("admin",loguser);
                return "adminlogin";
            }
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public String register(HttpServletRequest req, HttpServletResponse res,
                           @RequestBody User user){
        try {
            if(!us.checkName(user)){
                return "uname repeat";
            }
            boolean flag = us.save(user);
            if(!flag) return "fail";
            req.getSession().setAttribute("user",us.login(user));
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest req, HttpServletResponse res,
                         @RequestParam("type") int type){
        if(type==1){
            req.getSession().removeAttribute("admin");
        }else{
            req.getSession().removeAttribute("user");
        }
        return "front/index";
    }

    @RequestMapping(value = "/changePwd", method = RequestMethod.POST)
    @ResponseBody
    public String changePwd(HttpServletRequest req, HttpServletResponse res,
                           @RequestBody UserVo uv){
        User suser = (User) req.getSession().getAttribute("user");
        User user = uv.getUser();
        if(!uv.getTempanswer().equals(suser.getAnswer())) return "answer error";
        if(!uv.getOldpwd().equals(suser.getPwd())) return "pwd error";
        try {
            if(us.modify(user)){
                return "success";
            }
            req.getSession().setAttribute("user",us.findById(user.getUid()));
            return "fail";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

    @RequestMapping(value = "/changeInfo", method = RequestMethod.POST)
    @ResponseBody
    public String changeInfo(HttpServletRequest req, HttpServletResponse res,
                             @Nullable @RequestParam("icon") MultipartFile file, @RequestParam("address") String address){
        String path = req.getSession().getServletContext().getRealPath("/usericon");
        User u = (User) req.getSession().getAttribute("user");
        u.setAddress(address);
        String temp = u.getUimg();
        u.setUimg(file.getOriginalFilename());
        try {
            if(UploadFile.saveFile(file,path) && us.modify(u)){
                if(temp!="user-default.png"){
                    File f = new File(path+"/"+temp);
                    if(f.delete()) return "success";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "fail";
    }

    @RequestMapping(value = "/admin/getUsersInfo", method = RequestMethod.GET)
    public String getUsersInfo(HttpServletRequest req, HttpServletResponse res){
        List<User> userlist = null;
        try {
            userlist = us.findAllUsers();
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("userlist",userlist);
        return "admin/user_manager";
    }

    @RequestMapping(value = "/admin/operaccount", method = RequestMethod.GET)
    @ResponseBody
    public String operaccount(HttpServletRequest req, HttpServletResponse res,
                              @RequestParam("uid") int uid,
                              @RequestParam("type") int type){
        boolean flag = false;
        try {
            if(type==0){
                flag = us.remove(uid);
            }else{
                flag = us.recover(uid);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(flag) return "success";
        return "fail";
    }
}
