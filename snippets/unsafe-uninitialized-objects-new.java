class C {
    private int f;
    public C() { f = 5; }
    public int getF() { return f; }
}
C c = new C();
assert c.getF() == 5;
