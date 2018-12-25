package cn.com.util;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;

import org.csource.common.MyException;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageServer;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerGroup;
import org.csource.fastdfs.TrackerServer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import cn.com.model.FileManagerConfig;

/**
 * <strong>类概要： FastDFS Java客户端工具类</strong> <br>
 * <strong>创建时间： 2016-9-26 上午10:26:48</strong> <br>
 * @author I'amour solitaire
 *
 */
@Component
public class FileManager implements FileManagerConfig {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1596178387775637078L;
	
	private static Logger logger = LoggerFactory.getLogger(FileManager.class);
	
	@Autowired
	private static MyStorageClient storageClient1;
	
	public FileManager() {
		try {
			logger.info("FASTDFS INSTALLING……");
			ClientGlobal.setG_charset(CustomizedPropertyPlaceholderConfigurer.getContextProperty("charset").toString());
			ClientGlobal.setG_anti_steal_token(Boolean.parseBoolean(CustomizedPropertyPlaceholderConfigurer.getContextProperty("http.anti_steal_token").toString()));
			ClientGlobal.setG_connect_timeout(Integer.parseInt(CustomizedPropertyPlaceholderConfigurer.getContextProperty("connect_timeout").toString())*1000);
			ClientGlobal.setG_network_timeout(Integer.parseInt(CustomizedPropertyPlaceholderConfigurer.getContextProperty("network_timeout").toString())*1000);
			ClientGlobal.setG_secret_key(CustomizedPropertyPlaceholderConfigurer.getContextProperty("http.secret_key").toString());
			ClientGlobal.setG_tracker_http_port(Integer.parseInt(CustomizedPropertyPlaceholderConfigurer.getContextProperty("http.tracker_http_port").toString()));
			/** TRACKER服务器列表  */
			InetSocketAddress[] tracker_servers = new InetSocketAddress[1];  
			tracker_servers[0] = new InetSocketAddress(InetAddress.getByName(CustomizedPropertyPlaceholderConfigurer.getContextProperty("tracker_server1").toString()),Integer.parseInt(CustomizedPropertyPlaceholderConfigurer.getContextProperty("tracker_port1").toString()));  
			ClientGlobal.setG_tracker_group(new TrackerGroup(tracker_servers));
			
			TrackerClient trackerClient = new TrackerClient(ClientGlobal.g_tracker_group);
			TrackerServer trackerServer = trackerClient.getConnection();
			if (null == trackerServer) {
				logger.info("getConnection return null");
			}
			StorageServer storageServer = trackerClient.getStoreStorage(trackerServer);
			if (null == storageServer) {
				logger.info("getStoreStorage return null");
			}
			storageClient1 = new MyStorageClient(trackerServer, storageServer);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

    /**
     * <strong>方法概要： 文件上传</strong> <br>
     * <strong>创建时间： 2016-9-26 上午10:26:11</strong> <br>
     * @param file
     * @param valuePairs
     * @return
     * @throws MyException 
     * @throws IOException 
     */
    public String upload(byte[] file, String fileName, NameValuePair[] meta_list) throws IOException, MyException {
        String uploadResults = null;
        try {
            uploadResults = storageClient1.upload_file1(file,fileName, meta_list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String fileAbsolutePath = CustomizedPropertyPlaceholderConfigurer.getContextProperty("storage1").toString()
                + SEPARATOR + uploadResults;
        return fileAbsolutePath;
    }
    
    /**
     * <strong>方法概要： 文件下载</strong> <br>
     * <strong>创建时间： 2016-9-26 上午10:28:21</strong> <br>
     * @param groupName
     * @param remoteFileName
     * @param specFileName
     * @return
     */
    public ResponseEntity<byte[]> download(String groupName,
            String remoteFileName,String specFileName) {
        byte[] content = null;
        HttpHeaders headers = new HttpHeaders();
        try {
            content = storageClient1.download_file(groupName, remoteFileName);
            headers.setContentDispositionFormData("attachment",  new String(specFileName.getBytes("UTF-8"),"iso-8859-1"));
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return new ResponseEntity<byte[]>(content, headers, HttpStatus.CREATED);
    }

}
