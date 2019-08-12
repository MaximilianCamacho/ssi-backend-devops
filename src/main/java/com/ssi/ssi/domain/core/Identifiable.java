package com.ssi.ssi.domain.core;

import java.io.Serializable;

/**
 * @autor Marco Herrera
 */
public interface Identifiable<T extends Serializable> extends Serializable {

    void setId(T id);

    T getId();
}
