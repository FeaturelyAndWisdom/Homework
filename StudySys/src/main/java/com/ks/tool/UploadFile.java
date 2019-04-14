package com.ks.tool;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;

public class UploadFile {

    public static boolean saveFile(MultipartFile file, String path) {
        if (!file.isEmpty()) {
            try {
                File filepath = new File(path);
                if (!filepath.exists())
                    filepath.mkdirs();
                String savePath = path +"\\"+ file.getOriginalFilename();
                file.transferTo(new File(savePath));
                return true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
