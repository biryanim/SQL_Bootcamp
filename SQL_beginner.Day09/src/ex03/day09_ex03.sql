DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;

DROP FUNCTION IF EXISTS  fnc_trg_person_insert_audit();
DROP FUNCTION IF EXISTS  fnc_trg_person_update_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit();

TRUNCATE person_audit;

CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS $trg_person_audit$
    BEGIN
        IF(tg_op = 'INSERT') THEN
            INSERT INTO person_audit VALUES (CURRENT_TIMESTAMP, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
            RETURN NEW;
        ELSEIF(tg_op = 'UPDATE') THEN
            INSERT INTO person_audit VALUES (CURRENT_TIMESTAMP, 'U', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
            RETURN NEW;
        ELSEIF(tg_op = 'DELETE') THEN
            INSERT INTO person_audit VALUES (CURRENT_TIMESTAMP, 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
            RETURN NEW;
        ELSE
            RETURN OLD;
        END IF;
    END;
    $trg_person_audit$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_audit
AFTER INSERT OR UPDATE OR DELETE ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
