package model2.mvcboard2;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileUtils;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/Home/write2.do")
public class WriteController2 extends HttpServlet{
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
         throws ServletException, IOException {
      req.getRequestDispatcher("/Freeboard/Write2.jsp").forward(req, resp);
   }
   
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
         throws ServletException, IOException {
      
      String saveDirectory = req.getServletContext().getRealPath("/Uploads");
      
      ServletContext application = getServletContext();
      int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
      
      MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
      if(mr == null) {
         JSFunction.alertLocation(resp, "제한용량초과 or 디렉토리 경로를 확인하세요.",
        		 					"../Home/write2.do");
      }
      
      MVCBoardDTO2 dto = new MVCBoardDTO2();
      dto.setName(mr.getParameter("name"));
      dto.setTitle(mr.getParameter("title"));
      dto.setContent(mr.getParameter("content"));
      dto.setPass(mr.getParameter("pass"));
      
      String fileName = mr.getFilesystemName("ofile");
      if (fileName != null) {
         String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
         String ext = fileName.substring(fileName.lastIndexOf("."));
         String newFileName = now + ext;
         
         File oldFile = new File(saveDirectory + File.separator + fileName); 
         File newFile = new File(saveDirectory + File.separator + newFileName); 
         oldFile.renameTo(newFile);
         
         dto.setOfile(fileName);
         dto.setSfile(newFileName);
      }
      
      MVCBoardDAO2 dao = new MVCBoardDAO2();
      int result = dao.insertWrite(dto);
      dao.close();
      
      if (result == 1) {
         resp.sendRedirect("../Home/list2.do");
      }
      else {
         resp.sendRedirect("../Home/write2.do");
      }
   }
}
