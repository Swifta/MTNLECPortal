/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swifta.lecportal.dblogic;

import com.swifta.lecportal.entities.MinimumRate;
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
public class MinimumRateDatabase {

    Logger logger = Logger.getLogger(MinimumRateDatabase.class);
    private DateUtilities dateUtility = new DateUtilities();
    private AppValues appValues = new AppValues();
    private PortalSession portalSession;

    public MinimumRate getMinimumRateByDate(String datecreated) throws SQLException {
        String sqlQuery = "select * from min_transaction where datecreated <= ? and datecreated >= ?";
        logger.info(sqlQuery);
        datecreated = dateUtility.incrementByADay(datecreated, appValues.DEFAULT_DATE_FORMAT);

        logger.info(sqlQuery);
        JDCConnection con = PortalDatabase.source.getConnection();
        PreparedStatement prepStmt = con.prepareStatement(sqlQuery);
        prepStmt.setString(1, datecreated);
        prepStmt.setString(2, datecreated);
        ResultSet res = prepStmt.executeQuery();
        MinimumRate minimumRate = null;

        while (res.next()) {

            minimumRate = new MinimumRate();

            minimumRate.setId(res.getInt("id"));
            minimumRate.setAmount(String.valueOf(res.getDouble("amount")));
            minimumRate.setDatecreated(res.getString("datecreated"));
        }
        PortalDatabase.source.returnConnection(con);
        return minimumRate;
    }

    public List<MinimumRate> getAllMinimumRates() throws SQLException {
        String sqlQuery = "select * from min_transaction ";
        logger.info(sqlQuery);
        JDCConnection con = PortalDatabase.source.getConnection();
        PreparedStatement prepStmt = con.prepareStatement(sqlQuery);
        ResultSet res = prepStmt.executeQuery();
        ArrayList<MinimumRate> minimumRates = new ArrayList<MinimumRate>();
        MinimumRate minimumRate;
        while (res.next()) {
            minimumRate = new MinimumRate();

            minimumRate.setAmount(String.valueOf(res.getDouble("amount")));
            minimumRate.setDatecreated(res.getString("datecreated"));
            minimumRate.setId(res.getInt("id"));
            logger.info("The minimum rate retrieved:::>>>>" + minimumRate.toString());
            minimumRates.add(minimumRate);
        }
        PortalDatabase.source.returnConnection(con);
        return minimumRates;
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

    public boolean createMinimumRate(MinimumRate minimumRate) throws SQLException, IOException, JSONException {
        String sqlQuery = "insert into min_transaction (id,amount,datecreated) values (?,?,?)";
        logger.info("Query : " + sqlQuery + ">>>>>>"+minimumRate.toString());
        JDCConnection connection = PortalDatabase.source.getConnection();
        PreparedStatement prepStmt = connection.prepareStatement(sqlQuery);
        prepStmt.setInt(1, (getLastID("min_transaction") + 1));
        prepStmt.setDouble(2, Double.valueOf(minimumRate.getAmount()));
        prepStmt.setString(3, new Timestamp(new Date().getTime()).toString());
        boolean ex = prepStmt.execute();

        //connection.close();

        PortalDatabase.source.returnConnection(connection);

        //send sms to user

        return ex;
    }
}