package com.lft.entity;

public class SpotType {
 
	private int typeId;
	private String typeName;
	
	public SpotType(){
		
	}
	public SpotType(int typeId, String typeName) {
		super();
		this.typeId = typeId;
		this.typeName = typeName;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	@Override
	public String toString() {
		return "SpotType [typeId=" + typeId + ", typeName=" + typeName + "]";
	}
	
	
}
