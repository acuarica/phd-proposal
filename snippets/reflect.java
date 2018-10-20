Class<?> stringClass = Class.forName("java.lang.String");
Method isEmptyMethod = stringClass.getMethod("isEmpty");
isEmptyMethod.invoke("Hola!");
