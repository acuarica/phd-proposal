class C {
    private int f;
    public C() { f = 5; }
    public int getF() { return f; }
}
C c = (C) unsafe.allocateInstance(C.class);
assert c.getF() == 5; // violated
