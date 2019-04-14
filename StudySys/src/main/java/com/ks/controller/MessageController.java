package com.ks.controller;

import com.ks.po.Message;
import com.ks.service.IMessageService;
import com.sun.istack.internal.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class MessageController {

    @Resource(name = "MessageServiceImpl")
    private IMessageService ms;

    @RequestMapping(value = "/front/getMessAll",method = RequestMethod.GET)
    public String getMessAll(HttpServletRequest req, HttpServletResponse res, @Nullable @RequestParam("type") int type){
        List<Message> meslst = null;
        try {
            meslst = ms.getAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("meslst",meslst);
        return "front/module/message";
    }

    @RequestMapping(value = "/front/module/getMessDetail",method = RequestMethod.GET)
    @ResponseBody
    public Message getMessDetail(HttpServletRequest req, HttpServletResponse res, @RequestParam("mid") int mid){
        Message mes = null;
        try {
            mes = ms.findByMid(mid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mes;
    }

    @RequestMapping(value = "/admin/getMesForadmin",method = RequestMethod.GET)
    public String getMesForadmin(HttpServletRequest req, HttpServletResponse res){
        List<Message> list = null;
        try {
            list = ms.getAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("meslist",list);
        return "admin/mes_manager";
    }

    @RequestMapping(value = "/admin/removeMes",method = RequestMethod.GET)
    @ResponseBody
    public String removeMesByAdmin(HttpServletRequest req, HttpServletResponse res,
                                   @RequestParam("mid") int mid){
        boolean flag = false;
        try {
            flag = ms.remove(mid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(flag) return "success";
        return "fail";
    }

    @RequestMapping(value = "/admin/addNewMes",method = RequestMethod.POST)
    @ResponseBody
    public String addNewMes(HttpServletRequest req, HttpServletResponse res,
                                   @RequestBody Message mes){
        boolean flag = false;
        try {
            flag = ms.save(mes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(flag) return "success";
        return "fail";
    }
}
