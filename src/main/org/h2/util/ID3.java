package org.h2.util;

/**
 * Created by vunguyen on 3/15/15.
 * based on ID3 Algorithm in Machine Learning in Action by Peter Harrington
 */

import java.sql.*;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.HashSet;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class ID3 {
    private List<String []> data = new ArrayList<String[]>();
    private String tablename;

    public ID3() {

    }

    public ID3(ResultSet rs, String name) {
        tablename = name;
        try {
            int rows = 0;
            ResultSetMetaData meta = rs.getMetaData();
            int columnCount = meta.getColumnCount();
            String[] row = new String[columnCount];
            int[] sqlTypes = new int[columnCount];
            for (int i = 0; i < columnCount; i++) {
                row[i] = meta.getColumnLabel(i + 1);
                sqlTypes[i] = meta.getColumnType(i + 1);
            }
            data.add(rows, row);

            while (rs.next()) {
                row = new String[columnCount];
                for (int i = 0; i < columnCount; i++) {
                    Object o;
                    switch (sqlTypes[i]) {
                        case Types.DATE:
                            o = rs.getDate(i + 1);
                            break;
                        case Types.TIME:
                            o = rs.getTime(i + 1);
                            break;
                        case Types.TIMESTAMP:
                            o = rs.getTimestamp(i + 1);
                            break;
                        default:
                            o = rs.getString(i + 1);
                    }
                    row[i] = o == null ? null : o.toString();
                }
                rows++;
                data.add(rows, row);

            }

        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void see() {
        if (data.size() > 0) {
            for (int i = 0; i < data.size(); i++) {
                System.out.println(Arrays.toString(data.get(i)));
            }
        }
    }

    public void see(List<String []> data) {
        if (data.size() > 0) {
            for (int i = 0; i < data.size(); i++) {
                System.out.println(Arrays.toString(data.get(i)));
            }
        }
    }

    public double calcShannonEntropy(List<String []> dataSet) {
        int numEntries = dataSet.size()-1;
        HashMap<String, Integer> labelCounts = new HashMap<String, Integer>();

        for (int i = 1; i <= numEntries; i++) {
            String[] feature = dataSet.get(i);
            String currentLabel = feature[feature.length-1];

            if (!labelCounts.containsKey(currentLabel)) {
                labelCounts.put(currentLabel, 0);
            }
            Integer val = labelCounts.get(currentLabel);
            labelCounts.put(currentLabel, val+1);
        }

        double shannonEnt = 0.0;

        for (String key: labelCounts.keySet()) {
            double prob = (double)labelCounts.get(key)/numEntries;
            shannonEnt -= prob * Math.log(prob)/Math.log(2.0);
        }

        return shannonEnt;
    }

    public List<String []> get() {
        return data;
    }

    public List<String []> splitDataSet(List<String []> dataSet, Integer axis, String value){
        List<String []> retDataSet = new ArrayList<String[]>();
        String [] labels = dataSet.get(0);

        int numEntries = dataSet.size()-1;

        for (int i = 1; i <= numEntries; i++) {
            String[] feature = dataSet.get(i);

            // copy the rows
            if (feature[axis].equals(value)) {
                String[] reducedFeature = new String[feature.length-1];
                for (int j = 0; j < feature.length; j++) {
                    if (j < axis) {
                        reducedFeature[j] = feature[j];
                    } else if (j > axis) {
                        reducedFeature[j-1] = feature[j];
                    }
                }
                retDataSet.add(reducedFeature);
            }
        }

        // copy labels
        String[] reducedLabels = new String[labels.length-1];
        for (int j = 0; j < labels.length; j++) {
            if (j < axis) {
                reducedLabels[j] = labels[j];
            } else if (j > axis) {
                reducedLabels[j-1] = labels[j];
            }
        }
        retDataSet.add(0, reducedLabels);
        return retDataSet;
    }

    public Integer chooseBestFeatureToSplit(List<String []> dataSet) {
        Integer bestFeature = -1;
        String [] labels = dataSet.get(0);
        int numFeatures = labels.length-1;
        double baseEntropy = calcShannonEntropy(dataSet);
        double bestInfoGain = 0.0;

        for (int i = 0; i < numFeatures; i++) {
            String[] featList = new String[dataSet.size()-1];
            for (int j = 1; j < dataSet.size(); j++) {
                featList[j-1] = dataSet.get(j)[i];
            }

            String[] uniqueVals = new HashSet<String>(Arrays.asList(featList)).toArray(new String[0]);

            double newEntropy = 0.0;

            for (String value: uniqueVals) {
                List<String[] > subDataSet = splitDataSet(dataSet, i, value);
                double prob = (double)(subDataSet.size()-1)/(dataSet.size()-1);
                newEntropy += prob * calcShannonEntropy(subDataSet);
            }
            double infoGain = baseEntropy - newEntropy;

            if (infoGain > bestInfoGain) {
                bestInfoGain = infoGain;
                bestFeature = i;
            }
        }


        return bestFeature;
    }

    public String majorityCnt(String[] classList) {
        HashMap<String, Integer> classCount = new HashMap<String, Integer>();

        for (String c: classList) {
            if (!classCount.containsKey(c)) {
                classCount.put(c, 0);
            }
            Integer val = classCount.get(c);
            classCount.put(c, val+1);
        }

        Integer max = 0;
        String maj = "";
        for (String key: classCount.keySet()) {
            if (classCount.get(key) >= max) {
                max = classCount.get(key);
                maj = key;
            }
        }

        return maj;
    }

    public String createTree(List<String[] > dataSet, String[] labels) {
        String[] classList = new String[dataSet.size()-1];
        for (int i = 1; i < dataSet.size(); i++) {
            String[] row = dataSet.get(i);
            classList[i-1] = row[row.length-1];
        }
        int count = 0;
        for (int i = 0; i < classList.length; i++) {
            if (classList[i].equals(classList[0])) {
                count++;
            }
        }
        if (count == classList.length) {
            return "'" + classList[0] + "'";
        }

        if (dataSet.get(0).length == 1) {
            return "'" + majorityCnt(classList) + "'";
        }

        Integer bestFeat = chooseBestFeatureToSplit(dataSet);
        String bestFeatLabel = labels[bestFeat];
        String myTree = "{'" + bestFeatLabel + "': ";

        String[] subLabels = new String[labels.length-1];
        for (int j = 0; j < labels.length; j++) {
            if (j < bestFeat) {
                subLabels[j] = labels[j];
            } else if (j > bestFeat) {
                subLabels[j-1] = labels[j];
            }
        }

        String[] featValues = new String[dataSet.size()-1];
        for (int i = 1; i < dataSet.size(); i++) {
            String[] row = dataSet.get(i);
            featValues[i-1] = row[bestFeat];
        }
        String[] uniqueVals = new HashSet<String>(Arrays.asList(featValues)).toArray(new String[0]);

        myTree += "{";
        myTree += "'" + uniqueVals[0] + "': " + createTree(splitDataSet(dataSet, bestFeat, uniqueVals[0]), subLabels);
        for (int j = 1; j < uniqueVals.length; j++) {
            myTree += ", '" + uniqueVals[j] + "': " + createTree(splitDataSet(dataSet, bestFeat, uniqueVals[j]), subLabels) + "";
        }
        myTree += "}}";


        // output to file
        BufferedWriter writer = null;
        try {
            writer = new BufferedWriter(new FileWriter(tablename));
            writer.write(myTree);
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            try {
                if (writer != null)
                    writer.close( );
            }
            catch (IOException e) {
                e.printStackTrace();
            }
        }

        return myTree;
    }

    public String[] getFeatures() {
        String[] labs = data.get(0);
        String[] labels = new String[labs.length-1];
        for (int i = 0; i < labs.length-1; i++) {
            labels[i] = labs[i];
        }

        return labels;
    }
}
