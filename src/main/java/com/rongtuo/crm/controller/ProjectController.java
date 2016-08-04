package com.rongtuo.crm.controller;

import com.github.pagehelper.Page;
import com.rongtuo.crm.domain.Project_list;
import com.rongtuo.crm.service.GuarantessService;
import com.rongtuo.crm.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by WangChangJie on 2016/6/25 0025.
 */
@Controller
@RequestMapping(value = "/project")
public class ProjectController {

    @Autowired
    private ProjectService projectService;
    @Autowired
    private GuarantessService guarantessService;
    //跳转到项目新增页面
    @RequestMapping(value = "/new")
    public ModelAndView newProject(){
        System.out.println("+++++++++++++++++++++++++++++++++++++");
        ModelAndView model = new ModelAndView();
        List listInfo = null;
        //下拉列表内容获取
        listInfo = guarantessService.selName();
        System.out.println("listInfo = "+listInfo.size());
        model.addObject("listInfo",listInfo);
        model.setViewName("project/Add");
        return  model;
    }
    //项目预审页面
    @RequestMapping(value = "/sel")
    public String  sel(){
        return "project/checkList";
    }
    //新增项目保存
    @RequestMapping(value = "/save")
    @ResponseBody
    public Map<String, Object> projectSave(Project_list project_list, HttpSession session){
        System.out.println("--------------save-----------------");
        Date time = new Date();
        project_list.setInsert_time(time);
        //通过Session获取录入人工号
//        Project_list  user = (Project_list)session.getAttribute(Const.SESSION_NSER);
//        project_list.setInsert_code(user.getInsert_code());
        int result = projectService.insert(project_list);
        System.out.println("result = " + result);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("result",result);
        if(result>0){
            map.put("message","保存成功！");
        }else{
            map.put("message","保存成功！");
        }
        return map;
    }

    @RequestMapping(value = "/instance")
    public ModelAndView  instanceShow(int id){
        ModelAndView model = new ModelAndView();
        System.out.println("=====instance传入id======="+id);
        model.addObject("id",id);
        model.setViewName("/project/FirstInstance");
        return model;
    }

    @RequestMapping(value = "/selinstance")
    @ResponseBody
    public Map<String,Object> selInstance(int id){
        System.out.println("==================调用instance方法==================     id="+id);
        try {
            List<Project_list> project_lists = projectService.selectById(id);
            Map<String, Object> map = new HashMap<String, Object>();
            if (project_lists != null && project_lists.size() > 0) {
                Project_list project_list = project_lists.get(0);
                String project_no = project_list.getProject_no();
                map.put("project_no", project_no);
                String project_name = project_list.getProject_name();
                map.put("project_name", project_name);
                int guarantee_id = project_list.getGuarantee_id();
                map.put("guarantee_id", guarantee_id);
                int counter_guarantee_id = project_list.getCounter_guarantee_id();
                map.put("counter_guarantee_id", counter_guarantee_id);
                double plan_money = project_list.getPlan_money();
                map.put("plan_money", plan_money);
                double min_money = project_list.getMin_money();
                map.put("min_money", min_money);
                double max_money = project_list.getMax_money();
                map.put("max_money", max_money);
                double risk_reserve = project_list.getRisk_reserve();
                map.put("risk_reserve", risk_reserve);
                double interest_rate = project_list.getInterest_rate();
                map.put("interest_rate", interest_rate);
                String project_purpose = project_list.getProject_purpose();
                map.put("project_purpose", project_purpose);
                int payment_method = project_list.getPayment_method();
                map.put("payment_method", payment_method);
                int cycle = project_list.getCycle();
                map.put("cycle", cycle);
                String cycle_unit = project_list.getCycle_unit();
                map.put("cycle_unit", cycle_unit);
                double fee = project_list.getFee();
                map.put("fee", fee);
                int project_type = 0;
                if (project_list.getProject_type() != null) {
                    project_type = project_list.getProject_type();
                }
                map.put("project_type", project_type);
                Date start_raising_time = project_list.getStart_raising_time();
                String startTime=ConverToString(start_raising_time);
                map.put("start_raising_time", startTime);
                Date end_raising_time = project_list.getEnd_raising_time();
                String endTime=ConverToString(end_raising_time);
                map.put("end_raising_time", endTime);
                String project_describe = project_list.getProject_describe();
                map.put("project_describe", project_describe);
            }
            return map;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(value = "/updateCheck")
    @ResponseBody
    public Map<String,Object> updateCheck(Project_list project_list){
        System.out.println("--------------updateCheck-----------------" );
        int  a = project_list.getId();
        int b = project_list.getProject_status();
        System.out.println("a = "+ a + "b = " + b);
        Date time = new Date();
        project_list.setPreliminary_audit_time(time);
        int result = projectService.updateCheck(project_list);
        System.out.println("--------------updateCheck.result-----------------"+ result+ "preliminary_audit_time = " + time);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("result",result);
        if(result>0){
            map.put("message","保存成功！");
        }else{
            map.put("message","保存成功！");
        }
        return map;
    }


    /**
     * 项目审核列表页面项目审核状态列表查询
     * @param pageNumber
     * @param pageSize
     * @param project_status
     * @return
     */
     @RequestMapping(value = "/query")
     @ResponseBody
    public Map<String,Object> query(int pageNumber,int pageSize,int project_status){
        System.out.println("-------------------query-------------------");
        System.out.println(project_status);
         Map<String, Object> map = new HashMap<String, Object>();
         Page<Project_list> page = null;
         if(project_status == -1){
            page = projectService.findPage(pageNumber,pageSize);
        }else{
            page = projectService.findPage(pageNumber,pageSize,project_status);
        }
        map.put("rows",page);
        map.put("total",page.getTotal());
        return map;
    }


    /**
     * 项目更新
     * @param project_list
     * @return
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Map<String,Object> update(Project_list project_list){
        Date time = new Date();
        project_list.setPreliminary_audit_time(time);
        String a = project_list.getProject_describe();
        System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&& " + a);
        int result = projectService.update(project_list);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("result",result);
        if(result>0){
            map.put("message","保存成功！");
        }else{
            map.put("message","保存成功！");
        }
        return map;
    }

    /**
     * 项目编辑跳转
     * @param id
     * @return
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public ModelAndView editData(int id){
        System.out.println("*********************editData*************************");
        ModelAndView model = new ModelAndView();
        List listInfo = guarantessService.selName();
        model.addObject("id",id);
        model.addObject("listInfo",listInfo);
        model.setViewName("/project/edit");
        return model;
    }

    /**
     * 项目编辑原始数据加载
     * @param id
     * @return
     */
    @RequestMapping(value = "/editData")
    @ResponseBody
    public Map<String ,Object> eidt(int id){
        System.out.println("####################eidt####################### id = " + id);
        List<Project_list> lists = projectService.selectById(id);
        System.out.println("-----lists.size()------" + lists.size());
        Map<String,Object> map = new HashMap<String, Object>();
        if(lists != null && lists.size()>0){
            Project_list list = lists.get(0);
            String project_no = list.getProject_no();
            System.out.println("project_no = " + project_no);
            map.put("project_no",project_no);
            String  project_name = list.getProject_name();
            map.put("project_name",project_name);
            String  project_purpose = list.getProject_purpose();
            map.put("project_purpose",project_purpose);
            Double  plan_money = list.getPlan_money();
            map.put("plan_money",plan_money);
            Double  min_money = list.getMin_money();
            map.put("min_money",min_money);
            Double  max_money = list.getMax_money();
            map.put("max_money",max_money);
            Double  trans_money = list.getTrans_money();
            map.put("trans_money",trans_money);
            Double  risk_reserve = list.getRisk_reserve();
            map.put("risk_reserve",risk_reserve);
            Integer cycle = list.getCycle();
            map.put("cycle",cycle);
            String  cycle_unit = list.getCycle_unit();
            map.put("cycle_unit",cycle_unit);
            Date start_raising_time = list.getStart_raising_time();
            String startTime = ConverToString(start_raising_time);
            map.put("start_raising_time",startTime);
            Date end_raising_time = list.getEnd_raising_time();
            String endTime = ConverToString(end_raising_time);
            map.put("end_raising_time",endTime);
            Integer payment_method = list.getPayment_method();
            map.put("payment_method",payment_method);
            Double  interest_rate = list.getInterest_rate();
            map.put("interest_rate",interest_rate);
            Double  fee = list.getFee();
            map.put("fee",fee);
            String  project_describe = list.getProject_describe();
            map.put("project_describe",project_describe);
            Integer  guarantee_id = list.getGuarantee_id();
            map.put("guarantee_id",guarantee_id);
            Integer  counter_guarantee_id = list.getCounter_guarantee_id();
            map.put("counter_guarantee_id",counter_guarantee_id);
            String  loan_employee_code = list.getLoan_employee_code();
            map.put("loan_employee_code",loan_employee_code);
            String  loan_employee_approva_code = list.getLoan_employee_approva_code();
            map.put("loan_employee_approva_code",loan_employee_approva_code);
            Integer project_type = list.getProject_type();
            map.put("project_type",project_type);
        }
       return map;
    }



    //Date to  String
    public static String ConverToString(Date date)
    {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        return df.format(date);
    }

}
