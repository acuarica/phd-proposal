

import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

public class Reflection {

	public static void main(String[] args) throws ClassNotFoundException, NoSuchMethodException, IllegalAccessException, InvocationTargetException {
		Class<?> stringClass = Class.forName("java.lang.String");
		Method isEmptyMethod = stringClass.getMethod("isEmpty");
		boolean isEmpty = (boolean) isEmptyMethod.invoke("Hola!");

		assert !isEmpty;
		System.out.println(isEmpty);
	}
}

