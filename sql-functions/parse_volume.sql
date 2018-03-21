CREATE OR REPLACE FUNCTION parse_volume(s TEXT) RETURNS TEXT AS $$
BEGIN
  RETURN regexp_replace(('0' || s), '[^\d]', '', 'g')::INT;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION convert_volume(text)
  RETURNS TEXT AS
$func$
BEGIN
   IF $1 = '' THEN  -- special case for empty string like requested
      RETURN '';
   ELSE
      RETURN CONCAT($1::int/1000, 'm³');
   END IF;

EXCEPTION WHEN OTHERS THEN
   RETURN $1;

END
$func$  LANGUAGE plpgsql IMMUTABLE;
