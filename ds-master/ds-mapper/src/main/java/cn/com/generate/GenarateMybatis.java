package cn.com.generate;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

/**
 * Created by kehui on 2015/1/5.
 */
public class GenarateMybatis {

	public static void main(String[] args) throws Exception {
		List<String> warnings = new ArrayList<String>();
		boolean overwrite = true;
//		File configFile = new File("/Users/apple/carepeople-all/carepeople-mapper/src/main/resources/generator/mybatis-generator-config-chenjian-psql.xml");
		File configFile = new File("D:/GIT/ds/ds-mapper/src/main/resources/generator/mybatis-generator-config-mayunkun-psql.xml");

		System.out.print(configFile.exists());
		ConfigurationParser cp = new ConfigurationParser(warnings);
		Configuration config = cp.parseConfiguration(configFile);
		DefaultShellCallback callback = new DefaultShellCallback(overwrite);
		MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
		myBatisGenerator.generate(null);
		System.out.println("ok");
	}

}
