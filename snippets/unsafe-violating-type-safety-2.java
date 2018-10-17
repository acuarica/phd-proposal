class C {
    private Object f = new Object();
}
C o = new C();
o.f = new Object();
o.f = 1234567890; // Compile-time error
