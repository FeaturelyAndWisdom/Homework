package com.ks.controller;

import com.ks.po.Gushi;
import com.ks.po.Knowledge;
import com.ks.service.IGushiService;
import com.ks.service.IKnowledgeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class StudyController {

    @Resource(name = "KnowledgeServiceImpl")
    private IKnowledgeService ks;

    @Resource(name = "GushiServiceImpl")
    private IGushiService gs;

    @RequestMapping(value = "/front/module/getHanziAll", method = RequestMethod.GET)
    public String getHanziAll(HttpServletRequest req, HttpServletResponse res){
        List<Knowledge> hanzilst = null;
        try {
            hanzilst = ks.findAllHz();
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("hanzilst",hanzilst);
        return "front/module/hanzi/wordstudy";
    }

    @RequestMapping(value = "/front/module/getChengyuAll", method = RequestMethod.GET)
    public String getChengyuAll(HttpServletRequest req, HttpServletResponse res){
        List<Knowledge> cylst = null;
        try {
            cylst = ks.findAllCy();
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("cylst",cylst);
        return "front/module/hanzi/chengyustudy";
    }

    @RequestMapping(value = "/front/module/getGushiAll",method = RequestMethod.GET)
    public String getGushiAll(HttpServletRequest req, HttpServletResponse res){
        List<Gushi> gslst = null;
        try {
            gslst = gs.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("gslst",gslst);
        return "front/module/gushi/gushistudy";
    }

    @RequestMapping(value = "/front/module/getGushiByGid",method = RequestMethod.GET)
    @ResponseBody
    public Gushi getGushiByGid(HttpServletRequest req, HttpServletResponse res, @RequestParam("gid") int gid){
        Gushi gus = null;
        try {
            gus = gs.findByGid(gid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return gus;
    }

    @RequestMapping(value = "/admin/getHanzis",method = RequestMethod.GET)
    public String getHanzis(HttpServletRequest req, HttpServletResponse res,
                            @RequestParam("type") int type){
        List<Knowledge> list = null;
        try {
            if(type==0){
                list = ks.findAllHz();
            }else {
                list = ks.findAllCy();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("knowlist",list);
        if(type==0) return "admin/hz_manager";
        return "admin/cy_manager";
    }

    @RequestMapping(value = "/admin/removeKnow",method = RequestMethod.GET)
    @ResponseBody
    public String removeKnow(HttpServletRequest req, HttpServletResponse res,
                            @RequestParam("kid") int kid){
        boolean flag = false;
        try {
            flag = ks.remove(kid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(flag) return "success";
        return "fail";
    }

    @RequestMapping(value = "/admin/getGushis",method = RequestMethod.GET)
    public String getGushis(HttpServletRequest req, HttpServletResponse res){
        List<Gushi> list = null;
        try {
            list = gs.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("gslist",list);
        return "admin/gs_manager";
    }

    @RequestMapping(value = "/admin/removeGushi",method = RequestMethod.GET)
    @ResponseBody
    public String removeGushi(HttpServletRequest req, HttpServletResponse res,
                              @RequestParam("gid") int gid){
        boolean flag = false;
        try {
            flag = gs.remove(gid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(flag) return "success";
        return "fail";
    }

    @RequestMapping(value = "/admin/addKnow",method = RequestMethod.POST)
    @ResponseBody
    public String addKnow(HttpServletRequest req, HttpServletResponse res,
                              @RequestBody Knowledge know){
        boolean flag = false;
        try {
            flag = ks.save(know);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(flag) return "success";
        return "fail";
    }

    @RequestMapping(value = "/admin/addGushi",method = RequestMethod.POST)
    @ResponseBody
    public String addGushi(HttpServletRequest req, HttpServletResponse res,
                          @RequestBody Gushi gushi){
        boolean flag = false;
        gushi.setWord(gushi.getWord().replaceAll("\n","\r\n"));
        gushi.setPinyin(gushi.getPinyin().replaceAll("\n","\r\n"));
        try {
            flag = gs.save(gushi);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(flag) return "success";
        return "fail";
    }
}
