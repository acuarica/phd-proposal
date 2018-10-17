class C {
    private Object f = new Object();
}
C o = new C();
long fieldOffset = unsafe.objectFieldOffset(
		C.class.getDeclaredField("f") );
unsafe.putInt(o, fieldOffset , 1234567890); // f now points to nirvana
