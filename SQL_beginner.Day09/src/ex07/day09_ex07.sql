CREATE OR REPLACE FUNCTION func_minimum(variadic arr numeric[]) RETURNS numeric AS
$$
DECLARE
    min numeric;
BEGIN
    min = arr[1];
    FOR i in 2..array_length(arr, 1)
        loop
            IF min > arr[i] THEN
                min:= arr[i];
            END IF;
        END LOOP;
    RETURN min;
END;
$$ LANGUAGE plpgsql;


SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
