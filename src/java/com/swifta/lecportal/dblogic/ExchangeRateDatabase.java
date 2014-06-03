/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swifta.lecportal.dblogic;

import com.swifta.lecportal.entities.ExchangeRate;
import com.swifta.lecportal.entities.School;
import com.swifta.lecportal.entities.SchoolAdmin;
import com.swifta.lecportal.entities.Student;
import com.swifta.lecportal.managedbeans.PortalSession;
import com.swifta.lecportal.utils.AppValues;
import com.swifta.lecportal.utils.DateUtilities;
import com.swifta.lecportal.utils.PortalDatabase;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.log4j.Logger;
import org.json.me.JSONException;

/**
 *
 * @author princeyekaso
 */
public class ExchangeRateDatabase {

    Logger logger = Logger.getLogger(ExchangeRateDatabase.class);
    private DateUtilities dateUtility = new DateUtilities();
    private AppValues appValues = new AppValues();
    private PortalSession portalSession;

    public ExchangeRate getExchangeRateByDate(String datecreated) throws SQLException {
        String sqlQuery = "select * from exchange_rate where timecreated <= ? and timecreated >= ?";
        logger.info(sqlQuery);
        datecreated = dateUtility.incrementByADay(datecreated, appValues.DEFAULT_DATE_FORMAT);

        logger.info(sqlQuery);
        JDCConnection con = PortalDatabase.source.getConnection();
        PreparedStatement prepStmt = con.prepareStatement(sqlQuery);
        prepStmt.setString(1, datecreated);
        prepStmt.setString(2, datecreated);
        ResultSet res = prepStmt.executeQuery();
        ExchangeRate exchangeRate = null;

        while (res.next()) {

            exchangeRate = new ExchangeRate();

            exchangeRate.setId(res.getInt("id"));
            exchangeRate.setLsdRate(String.valueOf(res.getDouble("lsd_value")));
            exchangeRate.setDatecreated(res.getString("timecreated"));
        }
        PortalDatabase.source.returnConnection(con);
        return exchangeRate;
    }

    public List<ExchangeRate> getAllExchangeRates() throws SQLException {
        String sqlQuery = "select * from exchange_rate ";
        logger.info(sqlQuery);
        JDCConnection con = PortalDatabase.source.getConnection();
        PreparedStatement prepStmt = con.prepareStatement(sqlQuery);
        ResultSet res = prepStmt.executeQuery();
        ArrayList<ExchangeRate> exchangeRates = new ArrayList<ExchangeRate>();
        ExchangeRate exchangeRate;
        while (res.next()) {
            exchangeRate = new ExchangeRate();

            exchangeRate.setLsdRate(String.valueOf(res.getDouble("lsd_value")));
            exchangeRate.setDatecreated(res.getString("timecreated"));
            exchangeRate.setId(res.getInt("id"));
            logger.info("The exchange rate retrieved:::>>>>" + exchangeRate.toString());
            exchangeRates.add(exchangeRate);
        }
        PortalDatabase.source.returnConnection(con);
        return exchangeRates;
    }

    private int getLastID(String tableName) throws SQLException {
        String sqlQuery = "select max(id) from " + tableName;
        JDCConnection connection = PortalDatabase.source.getConnection();
        ResultSet res = connection.createStatement().executeQuery(sqlQuery);
        int id = 0;
        while (res.next()) {
            id = res.getInt(1);
        }
        //connection.close();
        PortalDatabase.source.returnConnection(connection);
        return id;
    }

    public boolean createExchangeRate(ExchangeRate exchangeRate) throws SQLException, IOException, JSONException {
        String sqlQuery = "insert into exchange_rate (id,lsd_value,timecreated) values (?,?,?)";
        logger.info("Query : " + sqlQuery);
        JDCConnection connection = PortalDatabase.source.getConnection();
        PreparedStatement prepStmt = connection.prepareStatement(sqlQuery);
        prepStmt.setInt(1, (getLastID("exchange_rate") + 1));
        prepStmt.setDouble(2, Double.valueOf(exchangeRate.getLsdRate()));
        prepStmt.setString(3, new Timestamp(new Date().getTime()).toString());
        boolean ex = prepStmt.execute();

        //connection.close();

        PortalDatabase.source.returnConnection(connection);

        //send sms to user

        return ex;
    }
}