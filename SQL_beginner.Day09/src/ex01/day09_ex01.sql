CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS $trg_person_update_audit$
    BEGIN
        IF(tg_op = 'UPDATE') THEN
            INSERT INTO person_audit VALUES (CURRENT_TIMESTAMP, 'U', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
            RETURN NEW;
        END IF;
        RETURN OLD;
    END;
$trg_person_update_audit$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_update_audit
AFTER UPDATE ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
