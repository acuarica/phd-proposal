Constructor<Unsafe> c = Unsafe.class.getDeclaredConstructor();
c.setAccessible(true);
Unsafe unsafe = c.newInstance();
unsafe.freeMemory(1);
