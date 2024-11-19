CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop bigint default 10) RETURNS TABLE(fib_num bigint)
AS $$
DECLARE
    cur BIGINT := 0;
    prev BIGINT := 1;
BEGIN
    WHILE cur < pstop loop
        RETURN QUERY SELECT cur;
        cur:= cur + prev;
        prev:= cur - prev;
    END LOOP ;
END;
$$ LANGUAGE plpgsql;


select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
