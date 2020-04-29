package top.lyxwachs.service;
import org.apache.commons.lang3.StringUtils;
import org.csource.fastdfs.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * @program: fastdfs-demo
 **/
@Component
public class UploadService {

    @Value("${fastdfs.tracker_servers}")
    private String tracker_servers;

    @Value("${fastdfs.connect_timeout_in_seconds}")
    private int connect_timeout;

    @Value("${fastdfs.network_timeout_in_seconds}")
    private int network_timeout;

    @Value("${fastdfs.charset}")
    private String charset;
    
    @Value("${fastdfs.web_service_ip}")
    private String webServiceIp;
    
    /**
     *	 校验上传
     * @param multipartFile
     * @return
     */
    public String upload(MultipartFile multipartFile) {
        if (multipartFile == null) {
            throw new RuntimeException("文件不能为空");
        }
        // 上传至fastDFS, 返回文件id
        String fileId = this.fdfsUpload(multipartFile);
        if (StringUtils.isEmpty(fileId)) {
            System.out.println("上传失败");
            throw  new RuntimeException("上传失败");
        }
        return webServiceIp+fileId; //访问服务器上图片的地址
    }



    /**
     * 	上传至fastDFS
     * @param multipartFile
     * @return 文件id
     */
    private String fdfsUpload(MultipartFile multipartFile) {
        // 1. 初始化fastDFS的环境
        initFdfsConfig();
        // 2. 获取trackerClient服务
        TrackerClient trackerClient = new TrackerClient();
        try {
            TrackerServer trackerServer = trackerClient.getConnection();
            // 3. 获取storage服务
            StorageServer storeStorage = trackerClient.getStoreStorage(trackerServer);
            // 4. 获取storageClient
            StorageClient1 storageClient1 = new StorageClient1(trackerServer, storeStorage);
            // 5. 上传文件 (文件字节, 文件扩展名, )
            // 5.1 获取文件扩展名
            String originalFilename = multipartFile.getOriginalFilename();
            String extName = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
            // 5.2 上传
            String fileId = storageClient1.upload_file1(multipartFile.getBytes(), extName, null);
            //group1/M00/00/00/wKgKN16nInqADOYTABa39eAjKJo506.jpg
            return fileId;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    /**
     * 初始化fastDFS的环境
     */
    private void initFdfsConfig() {
        try {
            ClientGlobal.initByTrackers(tracker_servers);
            ClientGlobal.setG_connect_timeout(connect_timeout);
            ClientGlobal.setG_network_timeout(network_timeout);
            ClientGlobal.setG_charset(charset);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    

}


