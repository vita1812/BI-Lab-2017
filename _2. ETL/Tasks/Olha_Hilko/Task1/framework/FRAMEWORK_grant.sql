--GRANT EXECUTE ON grants_mgmt TO BL_CL;
grant EXECUTE ON FRAMEWORK.pkg_utl_drop to Public;
grant EXECUTE ON FRAMEWORK.PKG_UTL_GRANTS_MGMT to PUBLIC;

/*
grant EXECUTE ON  FRAMEWORK.pkg_utl_drop to BL_CL;
grant EXECUTE ON  FRAMEWORK.PKG_UTL_GRANTS_MGMT to BL_CL;
exec FRAMEWORK.PKG_UTL_GRANTS_MGMT.proc_grant ('select', 'src','emp','BL_CL');
*/