package cn.com.controller.system.file;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.csource.common.NameValuePair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.com.model.Result;
import cn.com.model.ResultFiles;
import cn.com.util.ConstantsUtil;
import cn.com.util.FileManager;

@Controller
@RequestMapping("/upload")
public class FileController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private FileManager fileManager;
	/**
	 * 文件上传
	 * @param fileToUpload
	 * @param request
	 * @param response
	 * @param name
	 * @param model
	 * @return
	 */
	@RequestMapping("/uploadindexvalidate.html")
	public @ResponseBody Result multiUploadIndex(@RequestParam(value = "file", required = false) MultipartFile fileToUpload,
			HttpServletRequest request, HttpServletResponse response, String name, Model model) {
		Result ajaxJson = new Result(false, ConstantsUtil.HTTPRESPONSE_STATE_ERROR);
		response.setContentType("text/plain; charset=UTF-8");
		String originalFilename = "";
		logger.info("文件上传开始……");
		try {
			if (fileToUpload.isEmpty()) {
				return ajaxJson;
			} else {
				originalFilename = fileToUpload.getOriginalFilename();
				logger.debug(originalFilename+"开始……");

				// 获取文件后缀名 
			    String ext = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
//			    FastDFSFile file = new FastDFSFile(fileToUpload.getBytes(),ext);
			    NameValuePair[] meta_list = null;
			    
			    String filePath = fileManager.upload(fileToUpload.getBytes(),ext,meta_list);
			    ajaxJson = new Result(true, filePath, ConstantsUtil.HTTPRESPONSE_STATE_TRUE);
			}
		} catch (Exception e) {
			logger.info("文件[" + originalFilename + "]上传失败,堆栈轨迹如下");
			ajaxJson.setMsg(e.getMessage());
			e.printStackTrace();
		}
		return ajaxJson;
	}
	
	/**
	 * 文件上传
	 * @param fileToUpload
	 * @param request
	 * @param responses
	 * @param name
	 * @param model
	 * @return
	 */
	@RequestMapping("/uploads.html")
	public @ResponseBody ResultFiles multiUploadIndexs(@RequestParam(value = "file", required = false) MultipartFile[] fileToUpload,
			HttpServletRequest request, HttpServletResponse response, String name, Model model) {
				return null;
//		List<ResultFiles.Obj> list = new ArrayList<ResultFiles.Obj>();
//		ResultFiles ajaxJson = new ResultFiles(false, ConstantsUtil.HTTPRESPONSE_STATE_ERROR);
//		response.setContentType("text/plain; charset=UTF-8");
//		String originalFilename = "";
//		logger.info("文件上传开始……");
//		try {
//			for (MultipartFile myfile : fileToUpload) {
//				if (myfile.isEmpty()) {
//					return ajaxJson;
//				} else {
//					originalFilename = myfile.getOriginalFilename();
//					logger.debug(originalFilename+"开始……");
//
//					// 获取文件后缀名 
//				    String ext = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
//				    FastDFSFile file = new FastDFSFile(myfile.getBytes(),ext);
//				    // 该段配置会在文件服务器相应目录生成元数据文件      -m
////				    NameValuePair[] meta_list = new NameValuePair[4];
////				    meta_list[0] = new NameValuePair("fileName", myfile.getOriginalFilename());
////				    meta_list[1] = new NameValuePair("fileLength", String.valueOf(myfile.getSize()));
////				    meta_list[2] = new NameValuePair("fileExt", ext);
////				    meta_list[3] = new NameValuePair("fileAuthor", FILE_AUTHOR);
////				    String filePath = fileManager.upload(file,meta_list);
//				    String filePath = fileManager.upload(file,null);
//				    ResultFiles.Obj obj = new ResultFiles(). new Obj();
//				    obj.setUrl(filePath);
//				    obj.setName(originalFilename);
//				    list.add(obj);
//				}
//			}
//			ajaxJson = new ResultFiles(true, list, ConstantsUtil.HTTPRESPONSE_STATE_TRUE);
//		} catch (Exception e) {
//			logger.info("文件[" + originalFilename + "]上传失败,堆栈轨迹如下");
//			ajaxJson.setMsg(e.getMessage());
//			e.printStackTrace();
//		}
//		return ajaxJson;
	}
	
	/**
	 * 文件下载
	 * @param fileToUpload
	 * @param request
	 * @param response
	 * @param name
	 * @param model
	 * @return
	 */
	@RequestMapping("/down.html")
	public ResponseEntity<byte[]> down(HttpServletRequest request, HttpServletResponse response) {
		logger.info("文件下载开始……");
		try {
			return fileManager.download(request.getParameter("group"), request.getParameter("remoteFileName"), request.getParameter("path"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
