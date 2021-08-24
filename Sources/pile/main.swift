import Backtrace
import Logging

Backtrace.install()
LoggingSystem.bootstrap(StreamLogHandler.standardError)

let logger = Logger(label: "")

//logger.trace("trace")
//logger.debug("debug")
//logger.info("info")
//logger.notice("notice")
//logger.warning("warning")
//logger.error("error")
//logger.critical("critical")

CLI.main()