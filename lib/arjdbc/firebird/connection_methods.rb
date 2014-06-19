ArJdbc::ConnectionMethods.module_eval do
  def firebird_connection(config)
    config[:adapter_spec] ||= ::ArJdbc::Firebird

    return jndi_connection(config) if jndi_config?(config)

    ArJdbc.load_driver(:Firebird) # ::Jdbc::Firebird.load_driver
    config[:driver] ||= 'org.firebirdsql.jdbc.FBDriver'

    config[:host] ||= 'localhost'
    config[:port] ||= 3050
    config[:url] ||= begin
      "jdbc:firebirdsql://#{config[:host]}:#{config[:port]}/#{config[:database]}"
    end

    jdbc_connection(config)
  end
  # alias_method :jdbcfirebird_connection, :firebird_connection
end
