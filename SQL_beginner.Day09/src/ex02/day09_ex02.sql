CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS $trg_person_delete_audit$
    BEGIN
        IF(tg_op = 'DELETE') THEN
            INSERT INTO person_audit VALUES (CURRENT_TIMESTAMP, 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
            RETURN NEW;
        END IF;
        RETURN OLD;
    END;
$trg_person_delete_audit$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_delete_audit
AFTER DELETE ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;
