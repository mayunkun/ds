package cn.com.generate.plugins;

import java.io.Serializable;
import java.util.List;

import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.PluginAdapter;
import org.mybatis.generator.api.dom.java.FullyQualifiedJavaType;
import org.mybatis.generator.api.dom.java.TopLevelClass;

/**
 * Created by kehui on 15-7-16.
 */
@SuppressWarnings("serial")
public class PojosPlugin extends PluginAdapter implements Serializable {
	@Override
	public boolean validate(List<String> warnings) {
		return true;
	}

	@Override
	public boolean modelBaseRecordClassGenerated(TopLevelClass topLevelClass, IntrospectedTable introspectedTable) {
		String serializableFullName = "java.io.Serializable";
		FullyQualifiedJavaType serializable = new FullyQualifiedJavaType(serializableFullName);
		topLevelClass.addSuperInterface(serializable);
		topLevelClass.addImportedType(serializableFullName);
		return super.modelBaseRecordClassGenerated(topLevelClass, introspectedTable);
	}
}
