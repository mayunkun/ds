package cn.com.model;

import java.io.Serializable;

public interface FileManagerConfig extends Serializable {

    public static final String FILE_DEFAULT_AUTHOR = "mayunkun";

    public static final String PROTOCOL = "http://";

    public static final String SEPARATOR = "/";

    public static final String TRACKER_NGNIX_ADDR = "192.168.43.183";

    public static final String TRACKER_NGNIX_PORT = "8888";

    public static final String CLIENT_CONFIG_FILE = "fdfs_client.conf";
}