package com.ssi.ssi.common.exception;

import com.ssi.ssi.domain.core.Identifiable;

/**
 * @autor Marco Herrera
 */
public class DomainEntityNotFoundException extends Exception {

    private Class<? extends Identifiable> entityClazz;

    public DomainEntityNotFoundException(Class<? extends Identifiable> entityClazz) {
        super("Entity not found for the given Identifier");
        this.entityClazz = entityClazz;
    }

    public Class<? extends Identifiable> getEntityClazz() {
        return entityClazz;
    }
}
