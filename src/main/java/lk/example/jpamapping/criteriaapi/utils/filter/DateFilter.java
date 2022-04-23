package lk.example.jpamapping.criteriaapi.utils.filter;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import java.util.Date;
import java.util.List;

/**
 * Filter class for {@link Date} type attributes.
 *
 * @see RangeFilter
 */
public class DateFilter extends RangeFilter<Date> {

    private static final long serialVersionUID = 1L;


    public DateFilter() {
    }


    /**
     * Instantiates a new Date filter.
     *
     * @param filter the filter
     */
    public DateFilter(final DateFilter filter) {
        super(filter);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public DateFilter copy() {
        return new DateFilter(this);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @DateTimeFormat(iso = ISO.DATE)
    public DateFilter setEquals(Date equals) {
        super.setEquals(equals);
        return this;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @DateTimeFormat(iso = ISO.DATE)
    public DateFilter setNotEquals(Date equals) {
        super.setNotEquals(equals);
        return this;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @DateTimeFormat(iso = ISO.DATE)
    public DateFilter setIn(List<Date> in) {
        super.setIn(in);
        return this;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @DateTimeFormat(iso = ISO.DATE)
    public DateFilter setNotIn(List<Date> notIn) {
        super.setNotIn(notIn);
        return this;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @DateTimeFormat(iso = ISO.DATE)
    public DateFilter setGreaterThan(Date equals) {
        super.setGreaterThan(equals);
        return this;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @DateTimeFormat(iso = ISO.DATE)
    public DateFilter setLessThan(Date equals) {
        super.setLessThan(equals);
        return this;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @DateTimeFormat(iso = ISO.DATE)
    public DateFilter setGreaterThanOrEqual(Date equals) {
        super.setGreaterThanOrEqual(equals);
        return this;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @DateTimeFormat(iso = ISO.DATE)
    public DateFilter setLessThanOrEqual(Date equals) {
        super.setLessThanOrEqual(equals);
        return this;
    }

}
