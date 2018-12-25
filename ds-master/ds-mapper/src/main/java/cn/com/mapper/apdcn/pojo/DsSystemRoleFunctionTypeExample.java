/**
 * @mbggenerated
 * @author kehui
 */
package cn.com.mapper.apdcn.pojo;

import cn.com.mapper.BaseExample;
import java.util.ArrayList;
import java.util.List;

public class DsSystemRoleFunctionTypeExample extends BaseExample {
    /* @mbggenerated */
    protected String orderByClause;

    /* @mbggenerated */
    protected boolean distinct;

    /* @mbggenerated */
    protected List<Criteria> oredCriteria;

    /* @mbggenerated */
    public DsSystemRoleFunctionTypeExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /* @mbggenerated */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /* @mbggenerated */
    public String getOrderByClause() {
        return orderByClause;
    }

    /* @mbggenerated */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /* @mbggenerated */
    public boolean isDistinct() {
        return distinct;
    }

    /* @mbggenerated */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /* @mbggenerated */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /* @mbggenerated */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /* @mbggenerated */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /* @mbggenerated */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /* @mbggenerated */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * 对应数据库表 ds_system_role_function_type
     *
     * @mbggenerated
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(String value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(String value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(String value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(String value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(String value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(String value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLike(String value) {
            addCriterion("id like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotLike(String value) {
            addCriterion("id not like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<String> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<String> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(String value1, String value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(String value1, String value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andRolefunctionidIsNull() {
            addCriterion("rolefunctionid is null");
            return (Criteria) this;
        }

        public Criteria andRolefunctionidIsNotNull() {
            addCriterion("rolefunctionid is not null");
            return (Criteria) this;
        }

        public Criteria andRolefunctionidEqualTo(String value) {
            addCriterion("rolefunctionid =", value, "rolefunctionid");
            return (Criteria) this;
        }

        public Criteria andRolefunctionidNotEqualTo(String value) {
            addCriterion("rolefunctionid <>", value, "rolefunctionid");
            return (Criteria) this;
        }

        public Criteria andRolefunctionidGreaterThan(String value) {
            addCriterion("rolefunctionid >", value, "rolefunctionid");
            return (Criteria) this;
        }

        public Criteria andRolefunctionidGreaterThanOrEqualTo(String value) {
            addCriterion("rolefunctionid >=", value, "rolefunctionid");
            return (Criteria) this;
        }

        public Criteria andRolefunctionidLessThan(String value) {
            addCriterion("rolefunctionid <", value, "rolefunctionid");
            return (Criteria) this;
        }

        public Criteria andRolefunctionidLessThanOrEqualTo(String value) {
            addCriterion("rolefunctionid <=", value, "rolefunctionid");
            return (Criteria) this;
        }

        public Criteria andRolefunctionidLike(String value) {
            addCriterion("rolefunctionid like", value, "rolefunctionid");
            return (Criteria) this;
        }

        public Criteria andRolefunctionidNotLike(String value) {
            addCriterion("rolefunctionid not like", value, "rolefunctionid");
            return (Criteria) this;
        }

        public Criteria andRolefunctionidIn(List<String> values) {
            addCriterion("rolefunctionid in", values, "rolefunctionid");
            return (Criteria) this;
        }

        public Criteria andRolefunctionidNotIn(List<String> values) {
            addCriterion("rolefunctionid not in", values, "rolefunctionid");
            return (Criteria) this;
        }

        public Criteria andRolefunctionidBetween(String value1, String value2) {
            addCriterion("rolefunctionid between", value1, value2, "rolefunctionid");
            return (Criteria) this;
        }

        public Criteria andRolefunctionidNotBetween(String value1, String value2) {
            addCriterion("rolefunctionid not between", value1, value2, "rolefunctionid");
            return (Criteria) this;
        }

        public Criteria andFunctiontypeidIsNull() {
            addCriterion("functiontypeid is null");
            return (Criteria) this;
        }

        public Criteria andFunctiontypeidIsNotNull() {
            addCriterion("functiontypeid is not null");
            return (Criteria) this;
        }

        public Criteria andFunctiontypeidEqualTo(String value) {
            addCriterion("functiontypeid =", value, "functiontypeid");
            return (Criteria) this;
        }

        public Criteria andFunctiontypeidNotEqualTo(String value) {
            addCriterion("functiontypeid <>", value, "functiontypeid");
            return (Criteria) this;
        }

        public Criteria andFunctiontypeidGreaterThan(String value) {
            addCriterion("functiontypeid >", value, "functiontypeid");
            return (Criteria) this;
        }

        public Criteria andFunctiontypeidGreaterThanOrEqualTo(String value) {
            addCriterion("functiontypeid >=", value, "functiontypeid");
            return (Criteria) this;
        }

        public Criteria andFunctiontypeidLessThan(String value) {
            addCriterion("functiontypeid <", value, "functiontypeid");
            return (Criteria) this;
        }

        public Criteria andFunctiontypeidLessThanOrEqualTo(String value) {
            addCriterion("functiontypeid <=", value, "functiontypeid");
            return (Criteria) this;
        }

        public Criteria andFunctiontypeidLike(String value) {
            addCriterion("functiontypeid like", value, "functiontypeid");
            return (Criteria) this;
        }

        public Criteria andFunctiontypeidNotLike(String value) {
            addCriterion("functiontypeid not like", value, "functiontypeid");
            return (Criteria) this;
        }

        public Criteria andFunctiontypeidIn(List<String> values) {
            addCriterion("functiontypeid in", values, "functiontypeid");
            return (Criteria) this;
        }

        public Criteria andFunctiontypeidNotIn(List<String> values) {
            addCriterion("functiontypeid not in", values, "functiontypeid");
            return (Criteria) this;
        }

        public Criteria andFunctiontypeidBetween(String value1, String value2) {
            addCriterion("functiontypeid between", value1, value2, "functiontypeid");
            return (Criteria) this;
        }

        public Criteria andFunctiontypeidNotBetween(String value1, String value2) {
            addCriterion("functiontypeid not between", value1, value2, "functiontypeid");
            return (Criteria) this;
        }
    }

    /* @mbggenerated */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * 对应数据库表 ds_system_role_function_type
     *
     * @mbggenerated
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}