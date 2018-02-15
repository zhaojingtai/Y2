package cn.appsys.tools;

import java.io.File;

public class DelFile {
       public static boolean delFile(String path){
    	   File file =new File(path);
			 return file.delete();
       }
}
