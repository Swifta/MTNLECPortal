/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swifta.lecportal.dblogic;

import com.swifta.lecportal.entities.PaymentMode;
import com.swifta.lecportal.managedbeans.PortalSession;
import com.swifta.lecportal.utils.PortalDatabase;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author princeyekaso
 */
public class PaymentModeDatabase {

    Logger logger = Logger.getLogger(SchoolDatabase.class);
    private PortalSession portalSession;

    public List<PaymentMode> getAllPaymentModes() throws SQLException {
        String sqlQuery = "select * from Payment_Mode";
        logger.info(sqlQuery);

        JDCConnection connection = PortalDatabase.source.getConnection();
        ResultSet res = connection.createStatement().executeQuery(sqlQuery);

        ArrayList<PaymentMode> paymentModes = new ArrayList<PaymentMode>();

        while (res.next()) {
            PaymentMode pm = new PaymentMode();

            pm.setType(res.getString("type"));
            pm.setId(res.getInt("id"));
            paymentModes.add(pm);
        }
        return paymentModes;
    }
}
