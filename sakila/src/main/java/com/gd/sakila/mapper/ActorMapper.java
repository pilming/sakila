package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Actor;

@Mapper
public interface ActorMapper {
	int insertActor(Actor actor);
	List<Actor> selectActorList();
	//List<Actor> selectActorList(Map<String, Object> parmMap); ui적용하면서 간소화
	int selectActorTotal(String searchWord);
	List<Map<String,Object>> selectActorOne(int actorId);
}
