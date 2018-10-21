@Override
public boolean equals( Object obj )
{
    if ( this == obj )
    {
        return true;
    }
    if ( (obj instanceof Difference) )
    {
        Difference that = (Difference) obj;
        return actualFirst == that.actualFirst && expectedFirst == that.expectedFirst
               && actualSecond == that.actualSecond && expectedSecond == that.expectedSecond
               && key.equals( that.key );
    }
    return false;
}
