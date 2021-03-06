// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.clinictests.web;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonNode;
import io.springlets.web.NotFoundException;
import java.io.IOException;
import org.springframework.boot.jackson.JsonComponent;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.clinictests.domain.Pet;
import org.springframework.roo.clinictests.service.api.PetService;
import org.springframework.roo.clinictests.web.PetDeserializer;

privileged aspect PetDeserializer_Roo_EntityDeserializer {
    
    declare @type: PetDeserializer: @JsonComponent;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return PetService
     */
    public PetService PetDeserializer.getPetService() {
        return petService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param petService
     */
    public void PetDeserializer.setPetService(PetService petService) {
        this.petService = petService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return ConversionService
     */
    public ConversionService PetDeserializer.getConversionService() {
        return conversionService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param conversionService
     */
    public void PetDeserializer.setConversionService(ConversionService conversionService) {
        this.conversionService = conversionService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param jsonParser
     * @param context
     * @param codec
     * @param tree
     * @return Pet
     * @throws IOException
     */
    public Pet PetDeserializer.deserializeObject(JsonParser jsonParser, DeserializationContext context, ObjectCodec codec, JsonNode tree) throws IOException {
        String idText = tree.asText();
        Long id = conversionService.convert(idText, Long.class);
        Pet pet = petService.findOne(id);
        if (pet == null) {
            throw new NotFoundException("Pet not found");
        }
        return pet;
    }
    
}
