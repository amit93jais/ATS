package com.ats.dao;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.dozer.DozerBeanMapper;

public class BeanMapper {

	private final static DozerBeanMapper mapper = new DozerBeanMapper();

	/*
	 * static { String mappingFileName = ShoppingProperties.getProperty(
	 * "DOZER_MAPPING_XML" );
	 * 
	 * if( mappingFileName !=null || mappingFileName != ""){ String
	 * mappingFile[] = mappingFileName.split(",");
	 * mapper.setMappingFiles(Arrays.asList(mappingFile)); } }
	 */

	public static <SRC, DEST> DEST maptoObj(SRC src, Class<DEST> destClass) {
		DEST dest = instantiate(destClass);
		mapper.map(src, dest, "");
		return dest;
	}

	public static <SRC, DEST> DEST maptoObj(SRC src, DEST dest) {
		mapper.map(src, dest, "");
		return dest;
	}

	public static <SRC, DEST> List<DEST> maptoList(List<SRC> srcList, List<DEST> destList, Class<DEST> destClass) {
		List<DEST> finalList = destList;

		DEST dest = null;
		if (finalList == null)
			finalList = new ArrayList<>();

		for (int i = 0; i < srcList.size(); i++) {
			SRC src = srcList.get(i);
			if (finalList.size() > i) {
				dest = maptoObj(src, finalList.get(i));
			} else {
				dest = (DEST) maptoObj(src, destClass);
				finalList.add(dest);
			}
		}

		return finalList;
	}

	protected static <T> T instantiate(Class<T> destClass) {
		T t = null;
		try {
			t = destClass.newInstance();
		} catch (InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		return t;
	}

}
