package cn.com.util;

import org.csource.fastdfs.StorageClient1;
import org.csource.fastdfs.StorageServer;
import org.csource.fastdfs.TrackerServer;

/**
 * 修复首次上传异常
 * @author I'amour solitaire
 *
 */
public class MyStorageClient extends StorageClient1{
	public MyStorageClient(TrackerServer trackerServer, StorageServer storageServer) {
		super(trackerServer, storageServer);
		super.storageServer = null;
	}
}
