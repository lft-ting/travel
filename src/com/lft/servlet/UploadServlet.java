package com.lft.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.lft.entity.User;
import com.lft.service.IUserService;
import com.lft.service.impl.UserServiceImpl;
import com.lft.util.DateUtil;

/**
 * 上传文件Servlet、同时修改用户个人信息
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IUserService service = UserServiceImpl.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				HttpSession session = request.getSession();
				
				//判断form表单是否为enctype="multipart/form-data"类型
				if(ServletFileUpload.isMultipartContent(request))
				{
					//1. 创建DiskFileItemFactory对象，设置缓冲区大小和临时文件目录
					DiskFileItemFactory factory = new DiskFileItemFactory();
					
					//2. 创建ServletFileUpload对象，并设置上传文件的大小限制。
					ServletFileUpload fileUpload = new ServletFileUpload(factory);
					fileUpload.setSizeMax(1024*1024*10);//10M 设置上传文件的总量大小  (以字节为单位 ) 1024byte=1kb   1024kb = 1M   1024M=1G.....
					fileUpload.setHeaderEncoding("utf-8");//设置编码格式
					
					//3. 调用ServletFileUpload.parseRequest方法解析request对象，得到一个保存了所有上传内容的List对象。
					List<FileItem> fileItemList = fileUpload.parseRequest(request);
					
					//4. 遍历list，每迭代一个FileItem对象，调用其isFormField方法判断是否是上传文件
					//最完整的用户信息
					User user = (User)session.getAttribute("user");
					for (FileItem fileItem : fileItemList) {
						
						//true 普通表单元素
						if(fileItem.isFormField())
						{
							String name = fileItem.getFieldName();//input的name属性值
							String value = fileItem.getString("utf-8");//input的value属性值
							
							//普通表单元素：userType = 4
							//普通表单元素：content = 备注
							System.out.println("普通表单元素：" + name + " = " + value);

							//界面需要修改参数的信息
							if("sex".equals(name))
							{
								user.setSex(value);
							}else if("username".equals(name))
							{
								user.setUsername(value);
							}else if("realName".equals(name))
							{
								user.setRealName(value);
							}
							else if("birthday".equals(name))
							{
								user.setBirthday(DateUtil.StringToDate(value));
							}
							else if("content".equals(name))
							{
								user.setContent(value);
							}
							
							System.out.println("更新参数后的用户信息：" + user);
						}
						//false 上传文件表单元素<input type="file">
						else
						{
							//①.获取上传文件名称
							String fileName = fileItem.getName();//获取上传文件的名称  1.jpg
							System.out.println("原文件名称：" + fileName);
							if(fileName != null && !"".equals(fileName))
							{
								//②.获取文件的扩展名
								String suffix = fileName.substring(fileName.lastIndexOf('.'));
								System.out.println("扩展名:" + suffix);//.jpg
								
								//③.生成新的唯一的值 + ".jpg"
								String newFileName = new Date().getTime() + suffix;//1555643965854.jpg
								System.out.println("新文件名称：" + newFileName);
								
								//5. 调用FileItem的write()方法，写入文件
								fileItem.write(new File("D:\\temp"+"\\"+newFileName));//uploadImage/1.jpg
								//fileItem.write(new File("E:\\Workspaces\\Eclipse_JAVA1\\day10_my12306\\WebContent\\uploadImage"+"\\"+newFileName));//uploadImage/1.jpg
								
								//6. 调用FileItem的delete()方法，删除临时文件
								fileItem.delete();
								
								//保存用户新的头像路径
								user.setImagePath("/image/"+newFileName);
							}
						}
					}
					//2.调用service完成修改功能
					boolean result = service.updateUser(user);
					System.out.println("修改结果：" + result);
					
					//处理结果
					if(result)
					{
						//3.更新session中的用户信息
						session.setAttribute("user", user);
						
						//4.将结果返回到浏览器界面
						response.sendRedirect(request.getContextPath() + "/html/userMsg_Edd.jsp");
					}
					else
					{
						//5.处理响应乱码
						response.setCharacterEncoding("utf-8");
						response.setContentType("text/plain;charset=utf-8");
						
						//6.告诉用户操作失败
						PrintWriter writer = response.getWriter();
						writer.write("修改失败：" + result);
						writer.flush();
						writer.close();
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}

}
