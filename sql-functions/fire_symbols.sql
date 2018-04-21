CREATE OR REPLACE FUNCTION fire_symbol_dir() RETURNS TEXT AS $$
BEGIN
  CASE current_setting('mapnik.country')
    WHEN 'CH' THEN RETURN 'symbols/CH';
    ELSE           RETURN 'symbols';
  END CASE;
EXCEPTION WHEN OTHERS THEN
   RETURN 'symbols';
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fire_symbol_color() RETURNS TEXT AS $$
BEGIN
  CASE current_setting('mapnik.country')
    WHEN 'CH' THEN RETURN 'blue';
    ELSE           RETURN 'red';
  END CASE;
EXCEPTION WHEN OTHERS THEN
   RETURN 'red';
END
$$ LANGUAGE plpgsql;


